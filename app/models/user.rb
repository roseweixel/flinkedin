class User < ActiveRecord::Base
  validates :name, :email, :password_digest, presence: true
  validates_uniqueness_of :email
  
  has_secure_password

  has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
