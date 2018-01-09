class ChangeTimeForWeeklyMeeting < ActiveRecord::Migration
  def up
    remove_column :weekly_meetings, :start_time
    remove_column :weekly_meetings, :end_time
    add_column :weekly_meetings, :start_hour, :float
    add_column :weekly_meetings, :end_hour, :float
  end

  def down
  end
end
