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
end
