require 'spec_helper'

describe "churches/new" do
  before(:each) do
    assign(:church, stub_model(Church,
      :name => "MyString",
      :description => "MyString",
      :locality => "MyString",
      :city => "MyString",
      :region => "MyString"
    ).as_new_record)
  end

  it "renders new church form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => churches_path, :method => "post" do
      assert_select "input#church_name", :name => "church[name]"
      assert_select "input#church_description", :name => "church[description]"
      assert_select "input#church_locality", :name => "church[locality]"
      assert_select "input#church_city", :name => "church[city]"
      assert_select "input#church_region", :name => "church[region]"
    end
  end
end
