class Answer < ActiveRecord::Base
  attr_accessible :question_id, :content, :value
  belongs_to :question
  has_many :responses

  def to_s
  	content
  end

end
