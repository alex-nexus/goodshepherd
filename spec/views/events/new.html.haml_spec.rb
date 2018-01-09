require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :name => "MyString",
      :description => "MyString",
      :year => 1,
      :location => "MyString",
      :type => "",
      :church_id => 1,
      :contact_user_id => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_year", :name => "event[year]"
      assert_select "input#event_location", :name => "event[location]"
      assert_select "input#event_type", :name => "event[type]"
      assert_select "input#event_church_id", :name => "event[church_id]"
      assert_select "input#event_contact_user_id", :name => "event[contact_user_id]"
    end
  end
end
