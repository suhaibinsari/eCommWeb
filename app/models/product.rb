class Product < ApplicationRecord
    
    validates :title, :description, presence: true, length: {minimum: 3, maximum: 50}
    belongs_to :category
    belongs_to :user
    belongs_to :brand
end
