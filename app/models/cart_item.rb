class CartItem < ApplicationRecord
    belongs_to :cart
    has_many :product

end
