class Meeting < ActiveRecord::Base
  attr_accessible :church_id, :weekly_meeting_id, 
                  :description, :end_time, :location, :name, :start_time, 
                  :attendance_count, :prophesy_count

  scope :after_time, lambda {|this_time| where("start_time > ?", this_time.to_s(:db)) }
  scope :before_time, lambda { |this_time| where("end_time < ?", this_time.to_s(:db)) }

  belongs_to :church
  
  def self.find_or_create_by_weekly_meeting(weekly_meeting, beginning_of_week)
    meeting_start_time = beginning_of_week.advance(:days => weekly_meeting.weekday-1, :hours => weekly_meeting.start_hour)
    meeting_end_time = beginning_of_week.advance(:days => weekly_meeting.weekday-1, :hours => weekly_meeting.end_hour)

    meeting = Meeting.where(:church_id => weekly_meeting.church_id, :name => weekly_meeting.name,
    :start_time => meeting_start_time, :end_time => meeting_end_time).first
    
    if meeting.nil?
      meeting = Meeting.create(:church_id => weekly_meeting.church_id, :name => weekly_meeting.name, :location => weekly_meeting.location,  
      :start_time => meeting_start_time, :end_time => meeting_end_time, :attendance_count => 0, :prophesy_count => 0)
    end
    meeting
  end

end
