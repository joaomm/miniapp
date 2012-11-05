class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string :name
      t.string :privacy
      t.references :user

      t.timestamps
    end
    add_index :task_lists, :user_id
  end
end
