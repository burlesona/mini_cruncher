class QuestionGroup < ActiveRecord::Base
  attr_accessible :master_test_id, :name, :questions_attributes

  belongs_to :master_test

  has_many :questions
  accepts_nested_attributes_for :questions, :allow_destroy => true

  def to_s
  	name
  end
end
