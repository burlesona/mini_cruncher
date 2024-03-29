class MasterTest < ActiveRecord::Base
  attr_accessible :instructions, :name, :question_groups_attributes

  has_many :assignments, :dependent => :destroy
  has_many :question_groups, :dependent => :destroy
  accepts_nested_attributes_for :question_groups, :allow_destroy => true

  def to_s
  	name
  end
end
