class AddAnsweredToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :answered, :integer
  end
end
