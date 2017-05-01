class TasksController < ApplicationController
  include Concerns::CorsCapable

  # do not use CSRF for CORS options
  skip_before_filter :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def options
    # dummy action, OPTIONS should be caught by cors_preflight_check
  end

  def index
    render json: Task.by_project(params[:project_id]).map(&:to_h)
  end

  def create
    Rails.logger.debug task_params
    task = Task.new(task_params)
    task.status = task.project.statuses.first
    if task.save
      render json: task.to_h, status: :created
    else
      Rails.logger.debug errors: task.errors.full_messages
      render json: { errors: task.errors.full_messages }, status: :conflict
    end
  end

  def update
    task_id = params[:id]
    task = Task.find(task_id)
    task.update_attributes(task_params)
    if task.save
      render json: task.to_h, status: :accepted
    else
      Rails.logger.debug errors: task.errors.full_messages
      render json: { errors: task.errors.full_messages }, status: :conflict
    end
  end

  private

  def task_params
    params
      .slice(:summary, :description, :project_id, :status_id, :deleted)
      .symbolize_keys
  end
end
