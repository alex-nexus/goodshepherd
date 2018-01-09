class CreateWeeklyMeetings < ActiveRecord::Migration
  def change
    create_table :weekly_meetings do |t|
      t.integer :church_id
      t.string :name
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :weekday
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
