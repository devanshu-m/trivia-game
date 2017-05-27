class TriviaController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@question = Question.all
	end

	def start
		allq = Question.tagged_with(params[:tag])
		questions = allq.where.not(user: current_user).map {|x| x.id}
		session[:c] = questions.count
		c = session[:c]

		session[:questions] = questions.sort_by{rand}[0...c]

		session[:count] = 0

		redirect_to :action => "question"
	end

	def allquestions
		allq = Question.where.not(user: current_user).map {|q| q.id}
		session[:c] = allq.count
		c = session[:c]

		session[:questions] = allq.sort_by{rand}[0...c]

		session[:count] = 0

		redirect_to :action => "question"
	end


	def question
		@count = session[:count]
		c = session[:c]

		if @count<c
			@question = Question.find(session[:questions][@count])
			session[:question] = @question.correct_ans
			session[:q] = @question
			@answer = Answer.select("user_id", "question_id").where(user: current_user, question: @question)
		else
			render 'thankyou'
		end

#		session[:count] +=1
	end

	def score
		@count = session[:count]

		s = current_user.score

		if session[:question].downcase.include? session[:answer].downcase || session[:question].downcase.match(session[:answer].downcase)
			s +=4
			session[:score] = s
		else
			s -=1
			session[:score] = s
		end

		current_user.score = session[:score]
		current_user.save

		session[:count] +=1
	end

	def thankyou
	end

end
