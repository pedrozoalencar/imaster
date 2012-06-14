require 'spec_helper'

describe "asks/edit" do
  before(:each) do
    @ask = assign(:ask, stub_model(Ask,
      :description => "MyString",
      :details => "MyText"
    ))
  end

  it "renders the edit ask form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => asks_path(@ask), :method => "post" do
      assert_select "input#ask_description", :name => "ask[description]"
      assert_select "textarea#ask_details", :name => "ask[details]"
    end
  end
end
