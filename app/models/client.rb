class Client < ActiveRecord::Base
  # MASS-ASSIGNMENT PROTECTION
  attr_accessible :code
  
  # ASSOCIATIONS
  has_many :tests

  # VALIDATIONS
  validates_presence_of :code
  validates_uniqueness_of :code

  # CALLBACKS
  before_validation :generate_code

  def to_param
  	code
  end

  def to_s
    code
  end

  private
  def generate_code
    self.code ||= SecureRandom.hex(3).upcase
  end

end
