class Church < ActiveRecord::Base
  mount_uploader :church_directory, ChurchDirectoryUploader

  attr_accessible :city, :description, :name, :region, :church_directory
  
  has_many :weekly_meetings
  has_many :memberships
  has_many :users, :through => :memberships   
end
