require 'spec_helper'

describe "asks/show" do
  before(:each) do
    @ask = assign(:ask, stub_model(Ask,
      :description => "Description",
      :details => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/MyText/)
  end
end
