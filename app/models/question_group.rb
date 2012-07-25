class QuestionGroup < ActiveRecord::Base
	# MASS-ASSIGNMENT PROTECTION
  attr_accessible :master_test_id, :name, :questions_attributes

  # ASSOCIATIONS
  belongs_to :master_test
  has_many :response_groups, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :allow_destroy => true

  # METHODS
  def to_s
  	name
  end
end
