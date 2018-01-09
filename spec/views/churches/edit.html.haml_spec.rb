require 'spec_helper'

describe "churches/edit" do
  before(:each) do
    @church = assign(:church, stub_model(Church,
      :name => "MyString",
      :description => "MyString",
      :locality => "MyString",
      :city => "MyString",
      :region => "MyString"
    ))
  end

  it "renders the edit church form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => churches_path(@church), :method => "post" do
      assert_select "input#church_name", :name => "church[name]"
      assert_select "input#church_description", :name => "church[description]"
      assert_select "input#church_locality", :name => "church[locality]"
      assert_select "input#church_city", :name => "church[city]"
      assert_select "input#church_region", :name => "church[region]"
    end
  end
end
