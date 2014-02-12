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
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project has been created" }
        format.js
      else
        format.html{ render :new, error: "Project could not be saved" }
        format.js { render text: @project.errors.full_messages.join('. '), status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated'}
        format.js
      else
        format.html { render :edit, error: "Project could not be edited" }
        format.js { render text: @project.errors.full_messages.join('. '), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to projects_path, notice: 'Project deleted' }
        format.js
      else
        format.html { redirect_to project_path(@project), error: "Project could not be deleted" }
        format.js { render text: @project.errors.full_messages.join('. '), status: :unprocessable_entity }
      end
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
