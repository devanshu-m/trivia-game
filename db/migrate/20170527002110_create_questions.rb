class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :ques
      t.string :correct_ans

      t.timestamps null: false
    end
  end
end
