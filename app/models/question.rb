class Question < ActiveRecord::Base

	validates :ques, presence: true
	validates :correct_ans, presence: true
end
