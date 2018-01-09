class WeeklyMeetingsController < ApplicationController
  before_filter :load_church
  # GET /weekly_meetings
  # GET /weekly_meetings.json
  def load_church
    @church = Church.find(params[:church_id])
  end
  
  def index    
    @weekly_meetings = @church.weekly_meetings  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weekly_meetings }
    end
  end

  # GET /weekly_meetings/1
  # GET /weekly_meetings/1.json
  def show
    @weekly_meeting = WeeklyMeeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weekly_meeting }
    end
  end

  # GET /weekly_meetings/new
  # GET /weekly_meetings/new.json
  def new
    @weekly_meeting = WeeklyMeeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weekly_meeting }
    end
  end

  # GET /weekly_meetings/1/edit
  def edit
    @weekly_meeting = WeeklyMeeting.find(params[:id])
  end

  # POST /weekly_meetings
  # POST /weekly_meetings.json
  def create
    @weekly_meeting = WeeklyMeeting.new(weekly_meeting_params)

    respond_to do |format|
      if @weekly_meeting.save
        format.html { redirect_to @weekly_meeting, notice: 'Weekly meeting was successfully created.' }
        format.json { render json: @weekly_meeting, status: :created, location: @weekly_meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @weekly_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_meetings/1
  # PATCH/PUT /weekly_meetings/1.json
  def update
    @weekly_meeting = WeeklyMeeting.find(params[:id])

    respond_to do |format|
      if @weekly_meeting.update_attributes(weekly_meeting_params)
        format.html { redirect_to @weekly_meeting, notice: 'Weekly meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekly_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_meetings/1
  # DELETE /weekly_meetings/1.json
  def destroy
    @weekly_meeting = WeeklyMeeting.find(params[:id])
    @weekly_meeting.destroy

    respond_to do |format|
      format.html { redirect_to weekly_meetings_url }
      format.json { head :no_content }
    end
  end

  private

  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def weekly_meeting_params
    params.require(:weekly_meeting).permit(:church_id, :description, :end_time, :location, :name, :start_time, :weekday)
  end
end
