require 'spec_helper'

feature "Create Tasks", %q{
  In order to remember my things to do
  As an user
  I want to create tasks on a task list
} do
  
  background do
    @user = create(:user)
    login_as @user, scope: :user
    
    @task_list = create(:task_list, user: @user)
    visit user_task_list_path(@user, @task_list)
  end
  
  scenario "With name" do
    click_link "New Task"
    fill_in "task_name", with: "My cool new task"
    submit_form "new_task"
    find(".task").should have_content("My cool new task")
  end
end