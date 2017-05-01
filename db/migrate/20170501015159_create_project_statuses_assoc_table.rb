class CreateProjectStatusesAssocTable < ActiveRecord::Migration
  def change
    create_table :projects_statuses do |t|
      t.integer :project_id
      t.integer :status_id
    end
  end
end
