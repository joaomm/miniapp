class TasksController < ApplicationController
  before_filter :fetch_task_list
  
  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      respond_with(@task_list.user, @task_list)
    else
      respond_with(@task)
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      respond_with(@task_list.user, @task_list)
    else
      @task.destroy if @task.name.empty?
      respond_with(@task)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task_list.user, @task_list)
  end
  
  private
    def fetch_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end   
end
