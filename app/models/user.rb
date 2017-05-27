class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions

  has_many :answers

  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_reputation :votes, source: {reputation: :votes, of: :questions}, aggregated_by: :sum

  def voted_for?(question)
  	evaluations.exists?(target_type: question.class, target_id: question.id)
  end
end
