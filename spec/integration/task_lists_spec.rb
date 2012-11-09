require 'spec_helper'

feature "Create Task List", %q{
  In order to manage my tasks
  As an user
  I want to create a task list
} do
  
  background do
    @user = create(:user)
    login_as @user, scope: :user
    visit '/'
    click_link "new_task_list"
  end
  
  scenario "Access and complete task list form with valid attributes" do
    fill_in "task_list_name", with: "New Task List"
    choose "Public"
    click_button "Create Task list"
    page.should have_content("Task list was successfully created.")
  end
   
  scenario "Using invalid attributes" do
    click_button "Create Task list"
    page.should_not have_content("Task list was successfully created.")
    page.should have_content("can't be blank")
  end
end