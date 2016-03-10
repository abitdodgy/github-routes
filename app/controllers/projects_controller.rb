class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
    @project = current_account.projects.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_account.projects.build(project_params)
    if @project.save
      redirect_to [current_account, @project]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to [current_account, @project]
    else
      render :edit
    end
  end

  def destroy
    @project.destroy!
    redirect_to current_account
  end

private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
