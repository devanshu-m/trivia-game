class Question < ActiveRecord::Base

	before_save :assign_answer

	validates :ques, presence: true
	validates_presence_of :option1, :option2
	validates :correct_ans, presence: true
	validates :tag_list, presence: true

	belongs_to :user

	has_many :answers

	has_reputation :votes, source: :user, aggregated_by: :sum

	acts_as_taggable

	def assign_answer

		if self.correct_ans == "1"
			self.correct_ans = self.option1
		else
			self.correct_ans = self.option2
		end
	end
end
