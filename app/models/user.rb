class User < ActiveRecord::Base
  validates :name, :email, :password_digest, presence: true
  validates_uniqueness_of :email
  
  has_secure_password
end
