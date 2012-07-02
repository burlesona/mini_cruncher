class QuestionsController < ApplicationController
	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def new
		@question = Question.new
	end

	def edit
		@question = Question.find(params[:id])
	end

	def create
		@question = Question.new(params[:question])

		if @question.save
			redirect_to @question, notice: 'Question was successfully created.'
		else
			render :new
		end
	end

	def update
		@question = Question.find(params[:id])

		if @question.update_attributes(params[:question])
			redirect_to @question, notice: 'Question was successfully updated.'
		else
			render :edit
		end

	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_url
	end
end
