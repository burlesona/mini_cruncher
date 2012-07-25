class AssignmentsController < ApplicationController
	before_filter :authenticate, :except => [:edit, :update]

	def index
		@assignments = Assignment.all
	end

	def show
		@assignment = Assignment.find(params[:id])
	end

	def new
		@assignment = Assignment.new
	end

	def edit
		@assignment = Assignment.find(params[:id])
		authorize! @assignment.client
	end

	def create
		@assignment = Assignment.new(params[:assignment])
		if @assignment.save
			redirect_to target_or(@assignment), notice: 'Assignment was successfully assigned.'
		else
			render :new
		end
	end

	def update
		@assignment = Assignment.find(params[:id])
		authorize! @assignment.client

		if @assignment.update_attributes(params[:assignment])
			redirect_to target_or(@assignment), notice: 'Assignment was successfully updated.'
		else
			render :edit
		end

	end

	def destroy
		@assignment = Assignment.find(params[:id])
		@assignment.destroy
		redirect_to target_or(assignments_url)
	end
end
