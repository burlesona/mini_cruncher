class ResponseSet < ActiveRecord::Base
  # MASS-ASSIGNMENT PROTECTION
  attr_accessible :client_id, :test_id, :responses_attributes
  
  # ASSOCIATIONS
  belongs_to :client
  belongs_to :test
  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
  
  # VALIDATIONS
  validates_presence_of :test, :client

  # CALLBACKS
  after_create :initialize_responses

  private
  def initialize_responses
  	self.test.questions.each do |question|
  		self.responses.create( :question_id => question.id )
  	end
  end

end
