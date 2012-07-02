class Test < ActiveRecord::Base
  attr_accessible :instructions, :name, :questions_attributes
  has_many :questions

  accepts_nested_attributes_for :questions, :allow_destroy => true
end
