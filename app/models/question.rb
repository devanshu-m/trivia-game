class Question < ActiveRecord::Base

	validates :ques, presence: true
	validates :correct_ans, presence: true
	validates :tag_list, presence: true

	belongs_to :user

	has_many :answers

	has_reputation :votes, source: :user, aggregated_by: :sum

	acts_as_taggable
end
