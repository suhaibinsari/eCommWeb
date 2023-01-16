class Comment < ApplicationRecord
  
  include Visible

  belongs_to :user
  belongs_to :product
  
end
