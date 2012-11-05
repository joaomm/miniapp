class TaskList < ActiveRecord::Base
  attr_accessible :name, :privacy, :user_id
  validates_presence_of :name, :privacy, :user
  belongs_to :user                             
end
