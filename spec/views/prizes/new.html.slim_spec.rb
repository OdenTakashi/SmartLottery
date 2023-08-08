require 'rails_helper'

RSpec.describe "prizes/new", type: :view do
  before(:each) do
    assign(:prize, Prize.new(
      name: "MyString",
      winners_count: 1,
      winning_email_subject: "MyString",
      winning_email_body: "MyString"
    ))
  end

  it "renders new prize form" do
    render

    assert_select "form[action=?][method=?]", prizes_path, "post" do

      assert_select "input[name=?]", "prize[name]"

      assert_select "input[name=?]", "prize[winners_count]"

      assert_select "input[name=?]", "prize[winning_email_subject]"

      assert_select "input[name=?]", "prize[winning_email_body]"
    end
  end
end
