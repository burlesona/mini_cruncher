class Client < ActiveRecord::Base
	# MASS-ASSIGNMENT PROTECTION
	attr_accessible :code, :master_test_ids

	# ASSOCIATIONS
	has_many :tests
	has_many :master_tests, :through => :tests

	# VALIDATIONS
	validates_presence_of :code
	validates_uniqueness_of :code

	# CALLBACKS
	after_initialize :generate_code

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

end