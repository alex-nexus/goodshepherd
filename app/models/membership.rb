class Membership < ActiveRecord::Base
  attr_accessible :church_id, :is_active, :user_id
  
  belongs_to :church
  belongs_to :user
  
  validates_uniqueness_of :church_id, :scope => :user_id
  validates_uniqueness_of :user_id, :scope => :church_id
  
  scope :active, where(:is_active => true)
end
