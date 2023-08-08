require 'rails_helper'

RSpec.describe "prizes/edit", type: :view do
  let(:prize) {
    Prize.create!(
      name: "MyString",
      winners_count: 1,
      winning_email_subject: "MyString",
      winning_email_body: "MyString"
    )
  }

  before(:each) do
    assign(:prize, prize)
  end

  it "renders the edit prize form" do
    render

    assert_select "form[action=?][method=?]", prize_path(prize), "post" do

      assert_select "input[name=?]", "prize[name]"

      assert_select "input[name=?]", "prize[winners_count]"

      assert_select "input[name=?]", "prize[winning_email_subject]"

      assert_select "input[name=?]", "prize[winning_email_body]"
    end
  end
end
