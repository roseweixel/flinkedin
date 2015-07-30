class User < ActiveRecord::Base
  validates :name, :email, :password_digest, presence: true
  validates_uniqueness_of :email
  
  has_secure_password

  has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "200x200>", :thumb => "100x100>" }, :default_url => ":style/placeholder-avatar.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :resume

  validates_attachment :resume, content_type: { content_type: "application/pdf" }, :default_url => "placeholder-resume.pdf"

  attr_accessor :delete_resume
  attr_accessor :delete_avatar

  before_validation { resume.clear if delete_resume == '1'; avatar.clear if delete_avatar == '1' }
end
