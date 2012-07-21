class MasterTestsController < ApplicationController
	before_filter :authenticate

	def index
		@master_tests = MasterTest.all
	end

	def show
		@master_test = MasterTest.find(params[:id])
	end

	def new
		@master_test = MasterTest.new
	end

	def edit
		@master_test = MasterTest.find(params[:id])
	end

	def create
		@master_test = MasterTest.new(params[:master_test])

		if @master_test.save
			redirect_to @master_test, notice: 'Master Test was successfully created.'
		else
			render :new
		end
	end

	def update
		@master_test = MasterTest.find(params[:id])

		if @master_test.update_attributes(params[:master_test])
			redirect_to @master_test, notice: 'Master Test was successfully updated.'
		else
			render :edit
		end

	end

	def destroy
		@master_test = MasterTest.find(params[:id])
		@master_test.destroy
		redirect_to master_tests_url
	end
end
