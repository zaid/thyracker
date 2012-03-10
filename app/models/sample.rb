class Sample
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  attr_accessible :taken_on, :tsh, :t3, :t4

  field :taken_on, :type => Date
  field :tsh, :type => Float
  field :t3, :type => Float
  field :t4, :type => Float

  validates :taken_on, :presence => true
  validates :tsh, :presence => true
  validates :t3, :presence => true
  validates :t4, :presence => true
end