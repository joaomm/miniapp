class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :task_lists
  has_and_belongs_to_many :favorite_task_lists, class_name: "TaskList"
  
  def mark_task_list_as_favorite(task_list)
    favorite_task_lists << task_list
    save
  end
  
  def unmark_task_list_as_favorite(task_list)
    favorite_task_lists.delete task_list
    save
  end
  
  def task_list_marked_as_favorite?(task_list)
    favorite_task_lists.include?(task_list)
  end
end
