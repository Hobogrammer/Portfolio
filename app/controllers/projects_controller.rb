class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created"
      redirect_to @project
    else
      flash[:error] = "Project could not be saved"
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated'
    else
      flash[:error] = "Project could not be edited"
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: 'Project deleted'
    else
      flash[:error] = "Project could not be deleted"
      redirect_to project_path(@project)
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  private

    def project_params
      params.require(:project).permit(:name, :technologies_used)
    end
end
