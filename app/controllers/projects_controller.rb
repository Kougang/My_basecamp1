class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def show
        @project = Project.find(params['id'])
    end

    def create
        @project = Project.new(permitted_params)
        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
        
    end

    def edit
    end

    def update
        if @project.update(permitted_params)
            redirect_to project_path(@project)
        else
            render :edit
        end
    end 

    def destroy
        # @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path, notice: "Le projet a été supprimé avec succès."
    end

    protected

    def permitted_params
        params.require(:project).permit(:name, :description)
    end

    def set_project
        @project = Project.find(params['id'])
    end

end
