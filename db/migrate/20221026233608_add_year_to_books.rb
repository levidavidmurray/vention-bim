class AddYearToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :year, :integer, null: false, default: 1970
  end
end
