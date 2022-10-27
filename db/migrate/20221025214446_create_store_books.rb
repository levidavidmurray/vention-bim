class CreateStoreBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :store_books do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :count, null: false, default: 0

      t.timestamps
    end
  end
end
