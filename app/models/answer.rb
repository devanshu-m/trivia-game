class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :submitted_ans, presence: true

  validates :user_id, uniqueness: { scope: [:question_id]}
end
