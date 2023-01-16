class Product < ApplicationRecord
    
    include Visible

    validates :title, :description, presence: true
    belongs_to :category
    belongs_to :user
    belongs_to :brand
    has_one_attached :avatar  
    has_many :comments, dependent: :destroy

  
end
