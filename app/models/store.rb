class Store < ApplicationRecord
  has_many :store_books

  #after_create_commit -> { broadcast_append_to "stores", partial: "stores/store_list_item", locals: { store: self }, target: "store_list_items" }

  def order_required?
    store_books.out_of_stock.count > 0
  end

end
