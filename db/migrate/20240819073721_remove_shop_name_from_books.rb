class RemoveShopNameFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :shop_name, :string
  end
end
