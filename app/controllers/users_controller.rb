class UsersController < ApplicationController 
  def mark_task_list_as_favorite
    @user = User.find(params[:user_id])
    @task_list = TaskList.find(params[:task_list_id])
    @user.mark_task_list_as_favorite(@task_list)
    respond_with(@task_list.user, @task_list)
  end
  
  def unmark_task_list_as_favorite
    @user = User.find(params[:user_id])
    @task_list = TaskList.find(params[:task_list_id])
    @user.unmark_task_list_as_favorite(@task_list)
    respond_with(@task_list.user, @task_list)
  end
end