class Event < ActiveRecord::Base
  attr_accessible :church_id, :contact_user_id, :description, :end_date, :location, :name, :registration_deadline, :start_date, :type, :year
end
