class QuestionsController < ApplicationController

	before_action :authenticate_user!


	def create
		@question = current_user.questions.new(question_params)

		respond_to do |format|
			if @question.save
				format.html { redirect_to(:action => 'new', :notice => 'Question created successfully') }
				format.xml { render :xml => @question, :status => :created, :location => @question }
			else
				format.html { render :action => 'new'}
				format.xml { render :xml => @questions.errors, :status => :unprocessable_entity }
			end
		end
	end

	def new
		@question = Question.new
	end

	def show
		@question = Question.find(params[:id])
	end

	def index
		@question = Question.all
	end

	private
		def question_params
			params.require(:question).permit(:ques, :correct_ans)
		end
end
