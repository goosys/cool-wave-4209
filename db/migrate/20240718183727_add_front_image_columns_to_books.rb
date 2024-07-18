class AddFrontImageColumnsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :front_image_id, :string
    add_column :books, :front_image_filename, :string
    add_column :books, :front_image_size, :string
    add_column :books, :front_image_content_type, :string
  end
end
