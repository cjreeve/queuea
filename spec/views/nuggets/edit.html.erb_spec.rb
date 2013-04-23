require 'spec_helper'

describe "nuggets/edit" do
  before(:each) do
    @nugget = assign(:nugget, stub_model(Nugget,
      :question => "MyString",
      :answer => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit nugget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nuggets_path(@nugget), :method => "post" do
      assert_select "input#nugget_question", :name => "nugget[question]"
      assert_select "input#nugget_answer", :name => "nugget[answer]"
      assert_select "input#nugget_user_id", :name => "nugget[user_id]"
    end
  end
end
