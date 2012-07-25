class ResponseGroup < ActiveRecord::Base
  # MASS-ASSIGNMENT PROTECTION
  attr_accessible :assignment_id, :question_group_id, :responses_attributes
  
  # ASSOCIATIONS
  belongs_to :assignment
  belongs_to :question_group
  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
  
  # VALIDATIONS
  validates_presence_of :assignment

  # CALLBACKS
  before_create :setup_responses

  # METHODS
  delegate :name, :to => :question_group

  def total_value
  	self.responses.joins(:answer).sum('answers.value')
  end

  private
  def setup_responses
    self.question_group.questions.each do |question|
      self.responses.build :question_id => question.id
    end
  end
end
