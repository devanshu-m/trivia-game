class RemoveScore < ActiveRecord::Migration
  def change
  	remove_column :users, :score
  end
end
