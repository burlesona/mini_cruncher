class Question < ActiveRecord::Base
	attr_accessible :content, :test_id, :answers_attributes
	belongs_to :test

	has_many :answers
	accepts_nested_attributes_for :answers, :allow_destroy => true

	def to_s
		content
	end

end
