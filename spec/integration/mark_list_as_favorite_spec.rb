require 'spec_helper'

feature "Mark List as Favorite", %q{
  In order to follow other users's to-do lists
  As an user
  I want to mark a list as favorite
} do
  
  background do
    @user = create(:user)
    login_as @user, scope: :user
    
    @other_users_list = create(:task_list, privacy: "public")
  end
  
  scenario "Find a public list and mark as favorite" do
    visit '/task_lists'
    click_link @other_users_list.name
    click_link "Mark as favorite"
    @user.task_list_marked_as_favorite?(@other_users_list)
  end
end