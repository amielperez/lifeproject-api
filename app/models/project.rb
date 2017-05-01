class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :statuses
  belongs_to :starting_status, class_name: 'Status'
  belongs_to :ending_status, class_name: 'Status'

  def to_h
    {
      id: id,
      name: name,
      statuses: statuses.map { |s| { id: s.id, name: s.name } },
      starting_status: { id: starting_status.id, name: starting_status.name },
      ending_status: { id: ending_status.id, name: ending_status.name  }
    }
  end
end
