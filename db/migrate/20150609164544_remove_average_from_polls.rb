class RemoveAverageFromPolls < ActiveRecord::Migration
  def change
    remove_column :polls, :average
  end
end
