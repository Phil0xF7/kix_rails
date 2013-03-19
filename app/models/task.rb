class Task < ActiveRecord::Base
  attr_accessible :completed, :text, :type_task, :user_id
  # associations
  belongs_to :user

  # These values can be accessed throughout the
  # rails app by using Task::TYPES[:story_main]
  TYPES = {
    :story_main => 0,
    :story_long => 1,
    :story_email => 2,
    :story_edit_content => 3,
    :story_perspective => 4,

    :fin_goal => 5,
    :fin_rewards => 6,
    :fin_fulfill => 7,
    :fin_stretch_goals => 8,
    :fin_math => 9,

    :net_website => 10,
    :net_friends => 11,
    :net_social_media => 12,
    :net_blog => 13,
    :net_events => 14,

    :video_videographer => 15,
    :video_storyboard => 16,
    :video_filming => 17,
    :video_editing => 18,
    :video_sharing => 19,

    :marketing_print_material => 20,
    :marketing_events => 21,
    :marketing_networking => 22,
    :marketing_web_visibility => 23,
    :marketing_friends =>24
  }
end
