require 'spec_helper'

describe TaskList do
  it "should be valid with valid attributes" do
    build(:task_list).should be_valid
  end
  
  it "should not be valid without name" do
    build(:task_list, name: "").should_not be_valid
  end
   
  it "should not be valid without privacy" do
    build(:task_list, privacy: "").should_not be_valid
  end
  
  it "should not be valid without user" do
    build(:task_list, user_id: nil).should_not be_valid
  end
    
  describe "tasks" do
    before :each do
      @task_list = create(:task_list)
    end
    
    it "should be empty if no tasks of the given list was created" do  
      @task_list.tasks.should be_empty
    end
    
    it "should contain the list's tasks" do
      task = create(:task, task_list: @task_list)
      @task_list.tasks.should include task
    end
    
    it "should not contain task lists that are not the users" do
      task = create(:task)
      @task_list.tasks.should_not include task
    end 
  end
  
  
  describe "public scope" do
    it "should include public lists" do
      public_task_list = create(:task_list, privacy: "public")
      TaskList.public.should include(public_task_list)
    end
    
    it "should not include private lists" do
      private_task_list = create(:task_list, privacy: "private")
      TaskList.public.should_not include(private_task_list)
    end
  end
  
end
