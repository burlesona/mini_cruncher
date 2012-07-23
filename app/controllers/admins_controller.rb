class AdminsController < ApplicationController
	before_filter :authenticate

	def show
		@master_tests = MasterTest.all
		@clients = Client.all
	end

end
