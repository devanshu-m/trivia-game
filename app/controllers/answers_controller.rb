class AnswersController < ApplicationController

	before_action :authenticate_user!

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(answer_params.merge(user: current_user))

		if @answer.save
			session[:answer] = @answer.submitted_ans
			redirect_to trivia_score_url
		else
			redirect_to trivia_question_path
#			session[:count] -=1
			flash[:notice] = "Answer can't be blank"
		end
	end

	def show
	end

	private
		def answer_params
			params.fetch(:answer, {}).permit(:submitted_ans)
		end
end
