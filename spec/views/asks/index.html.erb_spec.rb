require 'spec_helper'

describe "asks/index" do
  before(:each) do
    assign(:asks, [
      stub_model(Ask,
        :description => "Description",
        :details => "MyText"
      ),
      stub_model(Ask,
        :description => "Description",
        :details => "MyText"
      )
    ])
  end

  it "renders a list of asks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
