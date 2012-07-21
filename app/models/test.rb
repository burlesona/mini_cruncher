class Test < ActiveRecord::Base
	attr_accessible :client_id, :master_test_id, :response_groups_attributes

	belongs_to :client
	belongs_to :master_test

	has_many :response_groups
	accepts_nested_attributes_for :response_groups, :allow_destroy => true
end