class ProjectsController < ApplicationController
  include Concerns::CorsCapable

  # do not use CSRF for CORS options
  skip_before_filter :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  DEFAULT_STATUSES = ['To-do', 'In Progress', 'Done']

  def options
    # dummy action, OPTIONS should be caught by cors_preflight_check
  end

  def index
    render json: Project.all.map(&:to_h)
  end

  def create
    project = Project.new(project_params)
    add_default_statuses(project)
    if project.save
      render json: project.to_h, status: :created
    else
      Rails.logger.debug errors: task.errors.full_messages
      render json: { errors: project.errors.full_messages }, status: :conflict
    end
  end

  private

  def project_params
    params
      .slice(:name)
      .symbolize_keys
  end

  def add_default_statuses(project)
    ['To-do', 'In Progress', 'Done'].each do |status_name|
      project.statuses << Status.find_by_name(status_name)

    project.starting_status = project.statuses.first
    project.ending_status = project.statuses.last
    end
  end
end
