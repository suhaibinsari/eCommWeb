class AddProductIdToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :products, foreign_key: true
  end
end
