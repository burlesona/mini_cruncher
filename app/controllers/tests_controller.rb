class TestsController < ApplicationController
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
	end

	def create
		@test = Test.new(params[:test])

		if @test.save
			redirect_to target_or(@test), notice: 'Test was successfully created.'
		else
			render :new
		end
	end

	def update
		@test = Test.find(params[:id])

		if @test.update_attributes(params[:test])
			redirect_to @test, notice: 'Test was successfully updated.'
		else
			render :edit
		end

	end

	def destroy
		@test = Test.find(params[:id])
		@test.destroy
		redirect_to target_or(tests_url)
	end

	private
	def target_or(object)
		if params[:redirect_back]
			:back
		else
			object
		end
	end

end
