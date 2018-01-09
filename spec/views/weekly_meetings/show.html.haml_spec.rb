require 'spec_helper'

describe "weekly_meetings/show" do
  before(:each) do
    @weekly_meeting = assign(:weekly_meeting, stub_model(WeeklyMeeting,
      :church_id => 1,
      :name => "Name",
      :weekday => 2,
      :location => "Location",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/2/)
    rendered.should match(/Location/)
    rendered.should match(/Description/)
  end
end
