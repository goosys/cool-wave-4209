class CreateBookPrintingHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :book_printing_histories do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :printing_number
      t.date :printed_at

      t.timestamps
    end
  end
end
