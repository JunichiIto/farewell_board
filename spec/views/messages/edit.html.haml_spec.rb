require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :user => nil,
      :text => "MyString",
      :to_user_id => 1
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_user", :name => "message[user]"
      assert_select "input#message_text", :name => "message[text]"
      assert_select "input#message_to_user_id", :name => "message[to_user_id]"
    end
  end
end
