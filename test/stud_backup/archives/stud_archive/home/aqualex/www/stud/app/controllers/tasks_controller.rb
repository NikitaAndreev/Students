class TasksController < ApplicationController
  before_action :login_required

  def index
    @task_type = params[:type]
    @tasks = Task.labs if @task_type=='lab'
    @tasks = Task.practices if @task_type=='practice'
  end

  def new
    @task = Task.new
    @task.task_type = params[:type]
  end

  def create
    @task = Task.new(task_params)
    @task.save!
    redirect_to tasks_path(type: @task.task_type)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_to tasks_path(type: @task.task_type)
  end



  private

  def task_params
    params.require(:task).permit( :num, :name, :task_type, :body, :asset)
  end


end