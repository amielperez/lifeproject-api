class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  def to_h
    { id: id, name: name }
  end
end
