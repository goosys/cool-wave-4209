class Book < ApplicationRecord
  extend Enumerize

  has_many :book_printing_histories

  accepts_nested_attributes_for :book_printing_histories, allow_destroy: true

  attachment :front_image

  has_rich_text :description_content

  enumerize :genre, in: { fiction: 0, non_fiction: 1 }, default: :fiction, scope: true

  def self.ransackable_scopes(_auth_object = nil)
    %i[
      with_genre
    ]
  end

  def self.ransackable_attributes(auth_object = nil)
    case auth_object
    when Analyzer::ApplicationController
      authorizable_ransackable_attributes - ["title", "author"]
    else
      authorizable_ransackable_attributes
    end
  end

  def least_book_printing_histories
    book_printing_histories.where(id: book_printing_histories.order(printing_number: :desc).limit(1).pluck(:id))
  end
end
