class ProjectsController < ApplicationController
  def index
    @projects = Project.select("projects.*, COUNT(tasks.id) as task_count").left_joins(:tasks).group(:id)
  end

  def show
    @project = Project.find(params[:id])
  end
end
