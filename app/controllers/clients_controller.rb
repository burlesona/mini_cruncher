class ClientsController < ApplicationController
	before_filter :authenticate, :except => :show

	def index
		@clients = Client.all
	end

	def show
		@client = Client.find_by_code(params[:id])
		@master_tests = MasterTest.all
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(params[:client])

		if @client.save
			redirect_to @client, notice: 'Client was successfully created.'
		else
			render :new
		end
	end

	def edit
		@client = Client.find_by_code(params[:id])
	end

	def update
		@client = Client.find_by_code(params[:id])

		if @client.update_attributes(params[:client])
			redirect_to @client, notice: 'Client was successfully updated.'
		else
			render :edit
		end

	end

	def destroy
		@client = Client.find_by_code(params[:id])
		@client.destroy
		redirect_to clients_url
	end

	# This action redirects to the client page
	# if a valid code is found.
	def lookup
		if @client = Client.find_by_code(params[:id])
			redirect_to @client, :notice => "Logged in."
		else
			redirect_to root_url, :alert => "Invalid code entered."
		end
	end

end
