require 'spec_helper'

describe "WeeklyMeetings" do
  describe "GET /weekly_meetings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get weekly_meetings_path
      response.status.should be(200)
    end
  end
end
