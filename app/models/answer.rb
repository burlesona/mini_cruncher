class Answer < ActiveRecord::Base
  attr_accessible :question_id, :content, :value
  belongs_to :question
end
