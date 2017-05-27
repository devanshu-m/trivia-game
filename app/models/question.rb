class Question < ActiveRecord::Base

	validates :ques, presence: true
	validates :correct_ans, presence: true

	belongs_to :user
end
