class ResponseGroup < ActiveRecord::Base
  # MASS-ASSIGNMENT PROTECTION
  attr_accessible :test_id, :responses_attributes
  
  # ASSOCIATIONS
  belongs_to :test
  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
  
  # VALIDATIONS
  validates_presence_of :test

  def total_value
  	self.responses.joins(:answer).sum('answers.value')
  end
end
