class CreateProductImgs < ActiveRecord::Migration[7.0]
  def change
    create_table :product_imgs do |t|

      t.timestamps
    end
  end
end
