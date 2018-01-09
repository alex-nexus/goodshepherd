require 'spec_helper'

describe "churches/index" do
  before(:each) do
    assign(:churches, [
      stub_model(Church,
        :name => "Name",
        :description => "Description",
        :locality => "Locality",
        :city => "City",
        :region => "Region"
      ),
      stub_model(Church,
        :name => "Name",
        :description => "Description",
        :locality => "Locality",
        :city => "City",
        :region => "Region"
      )
    ])
  end

  it "renders a list of churches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Locality".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
  end
end
