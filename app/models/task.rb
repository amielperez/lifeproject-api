class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :status

  default_scope { where(deleted: false) }
  scope :by_project, ->(project_id) { where(project_id: project_id) }

  def to_h
    {
      id: id,
      summary: summary,
      description: description,
      status_id: status_id,
      status_name: status.name,
      project_id: project_id
    }
  end
end
