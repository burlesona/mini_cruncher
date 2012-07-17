class Response < ActiveRecord::Base
  attr_accessible :answer_id, :question_id, :response_set_id
  
  belongs_to :response_set
  belongs_to :question
  belongs_to :answer
end
