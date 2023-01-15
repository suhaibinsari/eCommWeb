class AddUserIdToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :users, foreign_key: true

  end
end
