class TestsController < ApplicationController
	before_filter :authenticate, :except => [:edit, :update]

	def index
		@tests = Test.all
	end

	def show
		@test = Test.find(params[:id])
	end

	def new
		@test = Test.new
	end

	def edit
		@test = Test.find(params[:id])
		authorize! @test.client
	end

	def create
		@test = Test.new(params[:test])
		if @test.save
			redirect_to target_or(@test), notice: 'Test was successfully assigned.'
		else
			render :new
		end
	end

	def update
		@test = Test.find(params[:id])
		authorize! @test.client

		if @test.update_attributes(params[:test])
			redirect_to target_or(@test), notice: 'Test was successfully updated.'
		else
			render :edit
		end

	end

	def destroy
		@test = Test.find(params[:id])
		@test.destroy
		redirect_to target_or(tests_url)
	end
end
