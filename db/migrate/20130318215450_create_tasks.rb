class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :type_task
      t.text :text
      t.datetime :completed

      t.timestamps
    end
  end
end
