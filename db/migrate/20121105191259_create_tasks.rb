class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :task_list

      t.timestamps
    end
    add_index :tasks, :task_list_id
  end
end
