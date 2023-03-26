class Product < ApplicationRecord
    
    include Visible

    validates :title, :description, presence: true
    belongs_to :category
    belongs_to :user
    belongs_to :brand
    has_one_attached :profile_image  
    has_many :comments, dependent: :destroy
    has_many :orderables
    has_many :carts, through: :orderables

    def self.ransackable_attributes(auth_object = nil)
      # Allowlist only non-sensitive attributes that are needed for searching
      %w[id title description price created_at updated_at status category_id brand_id user_id]
    end

    def self.ransackable_associations(auth_object = nil)
      ['category', 'brand', 'title']
    end
  
end
