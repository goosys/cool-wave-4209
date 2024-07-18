class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.datetime :published_at
      t.integer :pages
      t.string :genre
      t.boolean :available
      t.decimal :price, precision: 8, scale: 2
      t.integer :language
      t.integer :rating

      t.timestamps
    end
  end
end
