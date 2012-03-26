class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :password_digest, :type => String

  embeds_many :samples

  has_secure_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :password, :presence => true, :confirmation => true
end
