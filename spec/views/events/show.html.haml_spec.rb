require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :description => "Description",
      :year => 1,
      :location => "Location",
      :type => "Type",
      :church_id => 2,
      :contact_user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
    rendered.should match(/Location/)
    rendered.should match(/Type/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
