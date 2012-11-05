class Task < ActiveRecord::Base
  belongs_to :task_list
  attr_accessible :name, :task_list, :task_list_id
  validates_presence_of :name, :task_list
end
