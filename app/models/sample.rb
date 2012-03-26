class Sample
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  attr_accessible :taken_on, :tsh, :t3, :t4

  field :taken_on, :type => Date
  field :tsh, :type => Float
  field :t3, :type => Float
  field :t4, :type => Float

  embedded_in :user

  validates :taken_on, :presence => true
  validates :tsh, :presence => true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :t3, :presence => true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :t4, :presence => true, numericality: { greater_than_or_equal_to: 0.0 }
end
