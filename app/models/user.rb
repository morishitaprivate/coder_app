class User < ApplicationRecord
  has_secure_password
  
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :login_id, presence: true, uniqueness: { case_sensitive: false }, on: :create
end
