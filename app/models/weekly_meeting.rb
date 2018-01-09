class WeeklyMeeting < ActiveRecord::Base
  attr_accessible :church_id, :description, :end_hour, :location, :name, :start_hour, :weekday  
  belongs_to :church
  has_many :meetings
  
  before_save :input_to_number
  
  validates_presence_of :name
  validates_inclusion_of :weekday, :in => 1..7
  validates_numericality_of :start_hour, :greater_than_or_equal_to => 0, :less_than => 24 
  validates_numericality_of :end_hour, :greater_than_or_equal_to => 0, :less_than => 24
  
  def input_to_number
    self.start_hour = self.start_hour.to_f
    self.end_hour = self.end_hour.to_f
    puts self.inspect       
  end  
end
