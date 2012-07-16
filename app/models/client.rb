class Client < ActiveRecord::Base
  attr_accessible :code

  has_many :tests

  before_validation :generate_code

  validates_presence_of :code
  validates_uniqueness_of :code

  def generate_code
  	self.code ||= SecureRandom.hex(3).upcase
  end

  def to_param
  	code
  end

  def to_s
    code
  end

end
