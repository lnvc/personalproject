class TasksController < ApplicationController
	before_action :set_task, only: [:edit, :update, :destroy]
	before_action :authenticate_user!
  def index
  	@tasks = Task.where(:status=>true).all
  	@near = Task.all.where("deadline != nil").where("(deadline - ?).to_i <= 2", Date.today).where(:status=>true)
  end
  def new
  	@task = Task.new
  end
  def create
  	@task = Task.new(task_params)
  	@task.status = true

  	if @task.save
  		redirect_to tasks_path, notice: "task added"
  	end
  end
  def edit
  	
  end
  def destroy
  	if @task.status == true
  		@task.status = false
  	else
  		@task.status = true
  	end

  	if @task.save
  		redirect_to tasks_path, notice: "check!"
  	else
  		redirect_to tasks_path, notice: "try again"
  	end
  end
  def update
  	if @task.update(task_params)
  		redirect_to tasks_path, notice: "updated"
  	else
  		redirect_to tasks_path, notice: "failed"
  	end
  end
  def uncheck
  	@tasks = Task.where(:status=>false).all
  end
  private
  	def task_params
  		params.require(:task).permit!
  	end
  	def set_task
  		@task = Task.find(params[:id])
  		if @task.nil?
  			redirect_to tasks_path, notice: "doesn't exists"
  		end
  		
  	end
end
