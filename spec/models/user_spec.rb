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
    
    it "should include the user's task list" do
      users_task_list = create(:task_list, user: @user)
      @user.task_lists.should include users_task_list
    end
    
    it "should not include task lists that are not the users" do
      not_users_task_list = create(:task_list)
      @user.task_lists.should_not include not_users_task_list
    end 
  end
  
  describe "favorite_task_lists" do
    before :each do
      @user = create(:user)
    end
    
    it "should be empty if user hasnt marked a list as favorite" do  
      @user.favorite_task_lists.should be_empty
    end
    
    it "should include lists that user maked as favorite" do
      task_list = create(:task_list)
      @user.favorite_task_lists = [task_list]
      @user.save
      User.find(@user.id).favorite_task_lists.should == [task_list]
    end
    
    it "should not include task lists that weren't marked as favorite" do
      not_favorite_task_list = create(:task_list)
      @user.favorite_task_lists.should_not include not_favorite_task_list
    end
   end
   
   describe "mark_task_list_as_favorite" do
     it "should add the list to favorites" do
       task_list = create(:task_list)
       user = create(:user)
       user.mark_task_list_as_favorite(task_list)
       User.find(user.id).favorite_task_lists.should include(task_list)
     end
   end
   
   describe "unmark_task_list_as_favorite" do
     it "should remove the list from the favorites" do
       task_list = create(:task_list)
       user = create(:user)
       user.mark_task_list_as_favorite(task_list)
       
       user.unmark_task_list_as_favorite(task_list)
       User.find(user.id).favorite_task_lists.should_not include(task_list)
     end
   end
   
   describe "marked_as_favorite?" do
     it "should be false if the list is not on the favorites" do
       task_list = create(:task_list)
       user = create(:user)
       user.task_list_marked_as_favorite?(task_list).should be_false
     end
     
     it "should be true if the list is on the favorites" do
       task_list = create(:task_list)
       user = create(:user)
       user.mark_task_list_as_favorite(task_list)
       user.task_list_marked_as_favorite?(task_list).should be_true
     end
   end
end
