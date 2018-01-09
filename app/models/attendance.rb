class Attendance < ActiveRecord::Base
  attr_accessible :is_active, :meeting_id, :user_id
  
  belongs_to :meeting
  belongs_to :user
  
  validates_uniqueness_of :meeting_id, :scope => :user_id
  validates_uniqueness_of :user_id, :scope => :meeting_id
end
