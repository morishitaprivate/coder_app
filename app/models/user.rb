class User < ApplicationRecord
  has_secure_password
  
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :login_id, presence: true
end
