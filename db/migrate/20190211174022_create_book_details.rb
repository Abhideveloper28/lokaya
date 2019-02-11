class CreateBookDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :book_details do |t|
      t.string :subject
      t.string :language
      t.string :publisher
      t.string :edition
      t.integer :pages
      t.integer :copies
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
