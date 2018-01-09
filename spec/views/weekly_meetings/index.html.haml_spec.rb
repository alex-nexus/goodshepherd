require 'spec_helper'

describe "weekly_meetings/index" do
  before(:each) do
    assign(:weekly_meetings, [
      stub_model(WeeklyMeeting,
        :church_id => 1,
        :name => "Name",
        :weekday => 2,
        :location => "Location",
        :description => "Description"
      ),
      stub_model(WeeklyMeeting,
        :church_id => 1,
        :name => "Name",
        :weekday => 2,
        :location => "Location",
        :description => "Description"
      )
    ])
  end

  it "renders a list of weekly_meetings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
