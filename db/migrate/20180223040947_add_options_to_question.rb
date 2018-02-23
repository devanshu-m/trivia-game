class AddOptionsToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :option1, :string
  	add_column :questions, :option2, :string
  	add_column :questions, :option3, :string
  	add_column :questions, :option4, :string
  	add_column :questions, :answered, :string
  end
end
