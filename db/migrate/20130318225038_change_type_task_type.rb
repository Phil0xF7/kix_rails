class ChangeTypeTaskType < ActiveRecord::Migration
  def up
    change_column :tasks, :type_task, :integer, :limit => nil
  end

  def down
    change_column :tasks, :type_task, :string
  end
end
