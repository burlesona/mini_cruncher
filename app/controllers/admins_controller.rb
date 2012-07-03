class AdminsController < ApplicationController
	before_filter :authenticate

	def show
		@clients = Client.all
	end

end
