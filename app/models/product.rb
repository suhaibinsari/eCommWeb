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
        # List the attributes that you want to make searchable
        %w[description price title ]
      end

end
