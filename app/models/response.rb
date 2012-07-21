class Response < ActiveRecord::Base
  attr_accessible :answer_id, :question_id, :response_group_id
  
  belongs_to :response_group
  belongs_to :question
  belongs_to :answer

  validates_presence_of :response_group, :question

  delegate :value, :to => :answer
end
