class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :summary
      t.text :description
      t.integer :project_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
