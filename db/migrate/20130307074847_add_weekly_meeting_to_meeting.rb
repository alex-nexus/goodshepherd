class AddWeeklyMeetingToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :weekly_meeting_id, :integer
  end
end
