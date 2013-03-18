class Task < ActiveRecord::Base
  attr_accessible :completed, :text, :type_task, :user_id
  # associations
  belongs_to :user
end
