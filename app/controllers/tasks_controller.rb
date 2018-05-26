class TasksController < ApplicationController
  def new
  	@task = Task.new
  end
  def create
  	@task = Task.new(task_params)
  	@task.status = true
  	if @task.save
  		redirect_to homes_index_path, notice: "Task successfully added."
  	end
  end
  def edit
  	@task = Task.find(params[:id])
  end
  private
  	def task_params
  		params.require(:task).permit(:name, :deadline)
  	end
end
