require 'spec_helper'

describe Task do
  it "should be valid with valid attributes" do
     build(:task).should be_valid
   end

   it "should not be valid without name" do
     build(:task, name: "").should_not be_valid
   end

   it "should not be valid without task list" do
     build(:task, task_list_id: nil).should_not be_valid
   end
end
