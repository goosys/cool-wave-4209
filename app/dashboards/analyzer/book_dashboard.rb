require "administrate/base_dashboard"

class Analyzer::BookDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    author: Field::String,
    available: Field::Boolean,
    description: Field::Text,
    front_image: Field::Refile,
    genre: Field::Enumerize,
    language: Field::Number,
    pages: Field::Number,
    price: Field::String.with_options(searchable: false),
    published_at: Field::DateTime,
    rating: Field::Number,
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    author
    available
    description
    front_image
  ].freeze

  # 
  COLLECTION_FILTER_TYPES = {
    author: Field::String,
    available: Field::Boolean,
    description: Field::Text,
    front_image: Field::Refile,
    genre: Field::Enumerize,
    language: Field::Number,
    pages: Field::Number,
    price: Field::String,
    published_at: Field::DateTime,
    rating: Field::Number,
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # 
  COLLECTION_EXPORT_TYPES = {
    id: Field::Number,
    author: Field::String,
    available: Field::Boolean,
    description: Field::Text,
    front_image: Field::Refile,
    genre: Field::Enumerize,
    language: Field::Number,
    pages: Field::Number,
    price: Field::String,
    published_at: Field::DateTime,
    rating: Field::Number,
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    author
    available
    description
    front_image
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

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    price
    title
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how books are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(book)
  #   "Book ##{book.id}"
  # end
end
