class TaskList < ActiveRecord::Base
  belongs_to :user                             
  attr_accessible :name, :privacy, :user_id
  validates_presence_of :name, :privacy, :user
  has_many :tasks
end
