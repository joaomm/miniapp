class UsersController < ApplicationController 
  before_filter :fetch_user, except: [:home]
  before_filter :fetch_task_list, only: [:mark_task_list_as_favorite, :unmark_task_list_as_favorite]

  def home
    @user = current_user
    @task_list = @user.task_lists.first
  end
  
  def mark_task_list_as_favorite
    @user.mark_task_list_as_favorite(@task_list)
    respond_with(@task_list.user, @task_list)
  end
  
  def unmark_task_list_as_favorite
    @user.unmark_task_list_as_favorite(@task_list)
    respond_with(@task_list.user, @task_list)
  end  
  
  private
    def fetch_user
      @user = User.find(params[:user_id])
    end
    
    def fetch_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end
end