class AddStartAndEndStatusToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :starting_status_id, :integer
    add_column :projects, :ending_status_id, :integer
  end
end
