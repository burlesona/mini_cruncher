class Response < ActiveRecord::Base
	# MASS-ASSIGNMENT PROTECTION
  attr_accessible :answer_id, :question_id, :response_group_id
  
  # ASSOCIATIONS
  belongs_to :response_group
  belongs_to :question
  belongs_to :answer

  # VALIDATIONS
  validates_presence_of :response_group, :question

  # METHODS
  delegate :value, :to => :answer

  def prompt
  	self.question.content
  end
end
