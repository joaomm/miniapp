class TaskList < ActiveRecord::Base
  belongs_to :user                             
  attr_accessible :name, :privacy, :user_id
  validates_presence_of :name, :privacy, :user
  has_many :tasks
  
  scope :public, where(privacy: "public")
  
  def public?
    privacy == "public"
  end
end
