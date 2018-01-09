require 'csv'

class ChurchesController < ApplicationController
  # GET /churches
  # GET /churches.json
  def index
    @churches = Church.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @churches }
    end
  end

  def calendar
    @church = current_user.default_church
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @church }
    end
  end

  def calendar_meetings
    @church = current_user.default_church
    @weekly_meetings = WeeklyMeeting.where(:church_id => @church.id)

    if params[:start].nil?
      beginning_of_week = DateTime.now.beginning_of_week(:sunday).utc
    else
      beginning_of_week = Time.at(params[:start].to_i).to_datetime
    end
    end_of_week = beginning_of_week.advance(:days => 7)

    @calendar_meetings = @weekly_meetings.map do |wm|
      start_time = beginning_of_week.advance(:days => wm.weekday-1, :hours => wm.start_hour)
      end_time = beginning_of_week.advance(:days => wm.weekday-1, :hours => wm.end_hour)

      this_meeting = Meeting.find_or_create_by_church_id_and_weekly_meeting_id(:church_id => @church.id, :weekly_meeting_id => wm.id)
      this_meeting.name = wm.name
      this_meeting.location = wm.location
      this_meeting.save

      {:title =>  wm.name,
        :url => users_church_meeting_attendances_path(@church, this_meeting),
        :start => start_time,
        :end => end_time,
        :allDay => false}
    end

    @meetings = Meeting.after_time(beginning_of_week).before_time(end_of_week)
    @meetings.each do |this_meeting|
      @calendar_meetings << {:title => this_meeting.name,
        :url => users_church_meeting_attendances_path(@church, this_meeting),
        :start => this_meeting.start_time,
        :end => this_meeting.end_time,
        :allDay => false}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calendar_meetings }
    end
  end

  # GET /churches/1
  # GET /churches/1.json
  def show
    @church = Church.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @church }
    end
  end

  # GET /churches/new
  # GET /churches/new.json
  def new
    @church = Church.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @church }
    end
  end

  # GET /churches/1/edit
  def edit
    @church = Church.find(params[:id])
  end

  # POST /churches
  # POST /churches.json
  def create
    @church = Church.new(church_params)

    respond_to do |format|
      if @church.save
        format.html { redirect_to @church, notice: 'Church was successfully created.' }
        format.json { render json: @church, status: :created, location: @church }
      else
        format.html { render action: "new" }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /churches/1
  # PATCH/PUT /churches/1.json
  def update
    @church = Church.find(params[:id])

    respond_to do |format|
      if @church.update_attributes(church_params)
        format.html { redirect_to @church, notice: 'Church was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /churches/1
  # DELETE /churches/1.json
  def destroy
    @church = Church.find(params[:id])
    @church.destroy

    respond_to do |format|
      format.html { redirect_to churches_url }
      format.json { head :no_content }
    end
  end

  def upload_directory
    @church = Church.find(params[:id])

    if params['commit'] == 'Upload' && !params['church']['church_directory'].nil?
      file_handle = params['church']['church_directory']
      file_name = file_handle.original_filename

      uploader = ChurchDirectoryUploader.new
      uploader.store!(file_handle) #store to server

      #read and process the csv
      CSV.foreach('/tmp/'+file_name, :headers => true) do |row|
        user = User.where(:email => row['Email']).first

        #create if none exists
        if user.nil?
          user = User.new(:email => row['Email'])
          user.password = 'password'
        end

        user.first_name = row['First Name']
        user.last_name = row['Last Name']
        user.phone = row['Phone']
        user.save!

        @church.users << user unless @church.users.include? user

      #TODO: save by familyeee
      end
    end
  end

  def members
    @church = Church.find(params[:id])
    @users = @church.users    
  end

  private

  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def church_params
    params.require(:church).permit(:city, :description, :locality, :name, :region)
  end
end
