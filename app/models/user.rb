class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :first_name, :last_name, :chinese_name,
    :phone, :address1, :address2, :city, :region, :country, :default_church_id 
  # attr_accessible :title, :body
  
  has_many :memberships, :dependent => :destroy
  has_many :churches, :through => :memberships
  belongs_to :default_church, :class_name => 'Church', :foreign_key => :default_church_id
    
  def full_name
    fn = ''
    fn += ' '+first_name unless first_name.nil?
    fn += ' '+last_name unless last_name.nil?
    fn.upcase
  end
end
