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
  
end
