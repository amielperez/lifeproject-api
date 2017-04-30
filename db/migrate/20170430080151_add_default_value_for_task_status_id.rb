class AddDefaultValueForTaskStatusId < ActiveRecord::Migration
  def change
    change_column :tasks, :status_id, :integer, default: 0
  end
end
