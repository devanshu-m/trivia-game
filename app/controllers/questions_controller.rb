class QuestionsController < ApplicationController

	before_action :authenticate_user!

	def new
		@question = Question.new
	end


	def create
		@question = current_user.questions.new(question_params)

		respond_to do |format|
			if @question.save
				format.html { redirect_to pages_index_path, :notice => 'Question created successfully' }
				format.xml { render :xml => @question, :status => :created, :location => @question }
			else
				format.html { render :action => 'new'}
				format.xml { render :xml => @questions.errors, :status => :unprocessable_entity }
			end
		end
	end

	def show
		@question = Question.find(params[:id])
	end

	def index
		if params[:tag]
			@question = Question.tagged_with(params[:tag])
		else
			@question = Question.all
		end
	end

	def vote
		value = params[:type] == "up" ? 1 : -1
		@question = Question.find(params[:id])
		@question.add_or_update_evaluation(:votes, value, current_user)
		redirect_to :back, :notice => "Thanks"
	end	

	private
		def question_params
			params.require(:question).permit(:ques, :correct_ans, :tag_list, :option1, :option2)
		end
end
