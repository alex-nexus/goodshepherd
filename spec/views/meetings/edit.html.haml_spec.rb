require 'spec_helper'

describe "meetings/edit" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting,
      :church_id => 1,
      :name => "MyString",
      :location => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit meeting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meetings_path(@meeting), :method => "post" do
      assert_select "input#meeting_church_id", :name => "meeting[church_id]"
      assert_select "input#meeting_name", :name => "meeting[name]"
      assert_select "input#meeting_location", :name => "meeting[location]"
      assert_select "input#meeting_description", :name => "meeting[description]"
    end
  end
end
