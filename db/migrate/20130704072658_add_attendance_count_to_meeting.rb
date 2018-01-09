class AddAttendanceCountToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :attendance_count, :integer
    add_column :meetings, :prophesy_count, :integer
    add_column :meetings, :note, :text
    
  end
end
