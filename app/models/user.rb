class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :password_digest, :type => String

  has_secure_password

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true
end
