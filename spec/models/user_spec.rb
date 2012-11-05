require 'spec_helper'

describe User do
  it "should not be valid without e-mail" do
    build(:user, email: "").should_not be_valid
  end
  
  it "should not be valid without password" do
    build(:user, password: "").should_not be_valid
  end
  
  it "should have an unique e-mail to be valid" do
    unique_user = create(:user)
    build(:user, email: unique_user.email).should_not be_valid    
  end
  
  describe "task lists" do
    before :each do
      @user = create(:user)
    end
    
    it "should be empty if no user's task list was created'" do  
      @user.task_lists.should be_empty
    end
    
    it "should contain the user's task list" do
      users_task_list = create(:task_list, user: @user)
      @user.task_lists.should include users_task_list
    end
    
    it "should not contain task lists that are not the users" do
      not_users_task_list = create(:task_list)
      @user.task_lists.should_not include not_users_task_list
    end 
  end
 
end
