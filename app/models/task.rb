class Task < ActiveRecord::Base
  belongs_to :project

  default_scope { where(deleted: false) }
  scope :by_project, ->(project_id) { where(project_id: project_id) }

  def to_h
    {
      id: id,
      summary: summary,
      description: description,
      status_id: status_id
    }
  end
end
