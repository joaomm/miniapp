class TaskListsController < ApplicationController
  before_filter :fetch_user
  
  def index
    @task_lists = @user.task_lists
    respond_with(@task_lists)
  end

  def show
    @task_list = TaskList.find(params[:id])
    respond_with(@user, @task_list)
  end

  def new
    @task_list = TaskList.new
    respond_with(@task_list)
  end

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def create
    @task_list = TaskList.new(params[:task_list])
    @task_list.save
    respond_with(@user, :task_lists)
  end

  def update
    @task_list = TaskList.find(params[:id])
    @task_list.update_attributes(params[:task_list])
    respond_with(@user, :task_lists)
  end

  def destroy
    @task_list = TaskList.find(params[:id])
    @task_list.destroy
    respond_with(@user, @task_list)
  end
  
  private
    def fetch_user
      @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    end
end
