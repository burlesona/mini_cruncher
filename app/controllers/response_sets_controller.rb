class ResponseSetsController < ApplicationController
	def index
		@response_sets = ResponseSet.all
	end

	def show
		@response_set = ResponseSet.find(params[:id])
	end

	def new
		@response_set = ResponseSet.new
	end

	def edit
		@response_set = ResponseSet.find(params[:id])
	end

	def create
		@response_set = ResponseSet.new(params[:response_set])

		if @response_set.save
			redirect_to @response_set, notice: 'Response set was successfully created.'
		else
			render :new
		end
	end

	def update
		@response_set = ResponseSet.find(params[:id])

		if @response_set.update_attributes(params[:response_set])
			redirect_to @response_set, notice: 'Response set was successfully updated.'
		else
			render :edit
		end

	end

	def destroy
		@response_set = ResponseSet.find(params[:id])
		@response_set.destroy
		redirect_to response_sets_url
	end
end
