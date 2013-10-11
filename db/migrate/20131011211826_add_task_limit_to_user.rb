class AddTaskLimitToUser < ActiveRecord::Migration
  def change
    add_column :users, :task_limit, :integer, default: 1
  end
end
