class Client < ActiveRecord::Base
  attr_accessible :code

  has_many :tests

  before_create :generate_code

  validates_presence_of :code
  validates_uniqueness_of :code


  def generate_code
  	self.code = SecureRandom.hex(6)
  end

end
