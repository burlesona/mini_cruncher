class Client < ActiveRecord::Base
	# MASS-ASSIGNMENT PROTECTION
	attr_accessible :code, :master_test_ids

	# VIRTUAL ATTRIBUTES
	attr_writer :master_test_ids
	def master_test_ids
		@master_test_ids ||= self.master_tests.map &:id
	end

	# ASSOCIATIONS
	has_many :tests
	has_many :master_tests, :through => :tests

	# VALIDATIONS
	validates_presence_of :code
	validates_uniqueness_of :code

	# CALLBACKS
	after_initialize :generate_code
	before_save :assign_tests

	# METHODS
	def to_param
		code
	end

	def to_s
		code
	end

	private
	def generate_code
		self.code ||= SecureRandom.hex(3).upcase
	end

	def assign_tests
		# TODO: This currently only assigns tests, it doesn't unassign them. Will need to fix that in the future.
		if master_test_ids.present?
			master_test_ids.each do |master_id|
				self.tests.find_or_create_by_master_test_id( master_id )
			end
		end
	end
end