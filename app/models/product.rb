class Product < ApplicationRecord
    
    include Visible

    validates :title, :description, presence: true
    belongs_to :category
    belongs_to :user
    belongs_to :brand
    has_one_attached :profile_image  
    has_many :comments, dependent: :destroy
    belongs_to :cart_items


  
end
