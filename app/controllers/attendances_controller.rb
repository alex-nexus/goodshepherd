class AttendancesController < ApplicationController
  def users
    @church = Church.find(params[:church_id])
    @meeting = Meeting.find(params[:meeting_id])
        
    @users = @church.users    
  end
  
  def create
    @meeting = Meeting.find(params[:meeting_id])        
    @user = User.find(params[:user_id])
    
    Attendance.create(:meeting_id => @meeting.id, :user_id => @user.id)
    
    respond_to do |format|
      format.json { render :json => { :success => true }}
    end
  end
  
  def destroy
    @meeting = Meeting.find(params[:meeting_id])        
    @user = User.find(params[:user_id])
    
    Attendance.delete_all(:meeting_id => @meeting.id, :user_id => @user.id)
    
    respond_to do |format|
      format.json { render :json => { :success => true }}
    end
  end
end
