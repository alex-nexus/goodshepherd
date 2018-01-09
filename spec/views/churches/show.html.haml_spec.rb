require 'spec_helper'

describe "churches/show" do
  before(:each) do
    @church = assign(:church, stub_model(Church,
      :name => "Name",
      :description => "Description",
      :locality => "Locality",
      :city => "City",
      :region => "Region"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Locality/)
    rendered.should match(/City/)
    rendered.should match(/Region/)
  end
end
