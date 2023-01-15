class RemoveCartItemIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :cart_items_id
  end
end
