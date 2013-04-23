require 'spec_helper'

describe "nuggets/index" do
  before(:each) do
    assign(:nuggets, [
      stub_model(Nugget,
        :question => "Question",
        :answer => "Answer",
        :user_id => 1
      ),
      stub_model(Nugget,
        :question => "Question",
        :answer => "Answer",
        :user_id => 1
      )
    ])
  end

  it "renders a list of nuggets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
