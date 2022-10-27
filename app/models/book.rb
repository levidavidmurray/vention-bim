class Book < ApplicationRecord
  belongs_to :author
  has_many :store_books

  scope :not_in_store, ->(store_id) { 
    # Have to write SQL directly as it doesn't seem possible to apply conditions to any ActiveRecord join methods
    # Only return books that don't have a store_book association with a specific store
    left_join_sanitized = ApplicationRecord.sanitize_sql([
      "LEFT JOIN store_books ON (store_books.book_id = books.id AND store_books.store_id = :store_id)",
      { store_id: store_id }
    ])
    joins(left_join_sanitized).where(store_books: { id: nil })
  }
end
