class Assignment < ActiveRecord::Base
	# MASS-ASSIGNMENT PROTECTION
	attr_accessible :client_id, :master_test_id, :response_groups_attributes

	# ASSOCIATIONS
	belongs_to :client
	belongs_to :master_test
	has_many :response_groups
	accepts_nested_attributes_for :response_groups, :allow_destroy => true

	# VALIDATIONS
	validates_presence_of :client, :master_test
	validates_uniqueness_of :master_test_id, :scope => :client_id

	# CALLBACKS
	before_create :setup_response_groups

	# METHODS
	delegate :name, :to => :master_test
	delegate :instructions, :to => :master_test

	private
	def setup_response_groups
		self.master_test.question_groups.each do |group|
			self.response_groups.build :question_group_id => group.id
		end
	end
end