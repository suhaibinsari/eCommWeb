class AddProductImgIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :product_imgs, foreign_key: true

  end
end
