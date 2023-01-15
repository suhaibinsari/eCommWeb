class Product < ApplicationRecord
    
    validates :title, :description, presence: true
    belongs_to :category
    belongs_to :user
    belongs_to :brand
    has_one_attached :avatar    
end
