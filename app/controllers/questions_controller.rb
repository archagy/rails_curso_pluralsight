class QuestionsController < ApplicationController
	

	def show
		@q = Question.find(params[:id])
		@answers = @q.answers.order(created_at: :desc)
	end
	def create
		Question.create(question_params)		
		redirect_to root_path
	end




	private 

	def question_params
		params.require(:question).permit(:email,:body)
	end
end
