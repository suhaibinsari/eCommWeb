class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
        #  enum :status, { draft: 0, published: 1, archived: 2 }, prefix: true, scopes: false

        enum role: [:user, :vendor, :admin]
        after_initialize :set_default_role, :if => :new_record?
        def set_default_role
          self.role ||= :user
        end
end
