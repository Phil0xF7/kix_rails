class Task < ActiveRecord::Base
  attr_accessible :completed, :text, :type_task, :user_id
end
