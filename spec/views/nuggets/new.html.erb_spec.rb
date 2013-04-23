require 'spec_helper'

describe "nuggets/new" do
  before(:each) do
    assign(:nugget, stub_model(Nugget,
      :question => "MyString",
      :answer => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new nugget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nuggets_path, :method => "post" do
      assert_select "input#nugget_question", :name => "nugget[question]"
      assert_select "input#nugget_answer", :name => "nugget[answer]"
      assert_select "input#nugget_user_id", :name => "nugget[user_id]"
    end
  end
end
