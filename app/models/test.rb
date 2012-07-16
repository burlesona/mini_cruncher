class Test < ActiveRecord::Base
  attr_accessible :instructions, :name, :questions_attributes

  belongs_to :client
  has_many :questions

  accepts_nested_attributes_for :questions, :allow_destroy => true

  def to_s
  	name
  end

end
