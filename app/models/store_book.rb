class StoreBook < ApplicationRecord
  belongs_to :book
  belongs_to :store

  scope :out_of_stock, -> { where('count = 0') }

  scope :in_stock, -> { where('count > 0') }

  scope :ordered_by_count, -> { order(count: :asc) }

  def in_stock?
    count > 0
  end

  def self.ordered_by_out_of_stock
    out = self.out_of_stock.to_a
    out.concat(self.in_stock)
  end

end
