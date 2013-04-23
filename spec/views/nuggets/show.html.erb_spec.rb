require 'spec_helper'

describe "nuggets/show" do
  before(:each) do
    @nugget = assign(:nugget, stub_model(Nugget,
      :question => "Question",
      :answer => "Answer",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    rendered.should match(/Answer/)
    rendered.should match(/1/)
  end
end
