class Book < ApplicationRecord
  has_many :book_printing_histories

  accepts_nested_attributes_for :book_printing_histories, allow_destroy: true

  attachment :front_image

  def least_book_printing_histories
    book_printing_histories.where(id: book_printing_histories.order(printing_number: :desc).limit(1).pluck(:id))
  end
end
