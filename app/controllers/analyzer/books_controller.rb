module Analyzer
  class BooksController < Analyzer::ApplicationController
    module Importable
      IMPORT_PARAMS =  %i[
        id
        author
        available
        description
        genre
        language
        pages
        price
        published_at
        rating
        title
        created_at
        updated_at
      ].freeze

      def import
        books, errors = [], []
        current_time = Time.current

        csv_data = CSV.foreach(params[:csv_file].path, encoding: 'BOM|UTF-8', headers: :first_row, header_converters: csv_header_converter, converters: :integer)
        return if email_duplicate?(csv_data)

        # ヘッダ行各列の整合性を確認し異常があれば異常列を1件抜粋
        if (invalid_headers = (IMPORT_PARAMS - csv_data.first.to_h.keys)).present?
          flash[:alert] = t(:'errors.messages.invalid_csv_header_columns', name: translated_name(invalid_headers.first))
          return redirect_to action: :index
        end

        csv_data.each_with_index do |row, index|
          book = Book.new(row.to_h.compact)
          if book.valid?
            books << book
          else
            book.errors.full_messages.uniq.each { |m| errors << "#{index + 2}行目：#{m}" }
          end
        end

        if errors.present?
          flash[:alert] = errors
          return redirect_to action: :index
        end

        ApplicationRecord.transaction do
          books.map do |book|
            book.save!(validate: false)
          end
        end
        flash[:notice] = translate_with_resource("create.success")
        redirect_to action: :index
      rescue CSV::MalformedCSVError
        flash[:alert] = ['一括登録', format(t(:'errors.messages.encoding'), name: 'UTF-8')].join
        redirect_to action: :index
      end

      def download_csv_format
        @csv_header = IMPORT_PARAMS.map { |attr_name| [attr_name, translated_name(attr_name)] }.to_h
        @csv_data = csv_sample_data
      end

      private

      def translated_name(attr_name)
        t(
          :"administrate_exportable.label.book.#{attr_name}",
          default: [
            :"activerecord.attributes.book.book/#{attr_name}",
            :"activerecord.attributes.book.#{attr_name}",
            Book.human_attribute_name(attr_name)
          ]
        )
      end

      def csv_header_converter
        header_converter_hash = IMPORT_PARAMS.map do |attr_name|
          [translated_name(attr_name), attr_name]
        end.to_h
        lambda { |h| header_converter_hash[h] }
      end

      def csv_sample_data
        [
          {
            author: 'String',
            available: 'true or false',
            description: 'String',
            genre: 'Fiction or Non-Fiction',
            language: 'English or Japanese',
            pages: 'Numeric',
            price: 'Numeric',
            published_at: '「yyyy-mm-dd」形式で入力してください',
            rating: 'Numeric',
            title: 'String'
          },
          {
            author: 'John Doe',
            available: true,
            description: 'A great book',
            genre: 'Fiction',
            language: 'English',
            pages: 200,
            price: 19.99,
            published_at: '2022-01-01',
            rating: 4.5,
            title: 'The Book'
          }
        ]
      end

      # 一括登録するCSV内の重複を確認
      def email_duplicate?(csv_data)
        emails = csv_data.pluck(:email).reject(&:blank?)
        duplicate_email = emails.select { |v| emails.count(v) > 1 }.uniq
        return false if duplicate_email.blank?

        flash[:alert] = "CSVファイル内の#{translated_name(:email)}：#{duplicate_email.join('、')}が重複しています"
        redirect_to action: :index
        true
      end
    end
    include Importable

  end
end
