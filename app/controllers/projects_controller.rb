class ProjectsController < ApplicationController
  def index
    @projects = Project.with_task_count.all
  end

  def show
    @project = Project.find(params[:id])
  end
end
