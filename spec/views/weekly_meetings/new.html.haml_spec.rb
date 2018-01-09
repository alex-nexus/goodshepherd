require 'spec_helper'

describe "weekly_meetings/new" do
  before(:each) do
    assign(:weekly_meeting, stub_model(WeeklyMeeting,
      :church_id => 1,
      :name => "MyString",
      :weekday => 1,
      :location => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new weekly_meeting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => weekly_meetings_path, :method => "post" do
      assert_select "input#weekly_meeting_church_id", :name => "weekly_meeting[church_id]"
      assert_select "input#weekly_meeting_name", :name => "weekly_meeting[name]"
      assert_select "input#weekly_meeting_weekday", :name => "weekly_meeting[weekday]"
      assert_select "input#weekly_meeting_location", :name => "weekly_meeting[location]"
      assert_select "input#weekly_meeting_description", :name => "weekly_meeting[description]"
    end
  end
end
