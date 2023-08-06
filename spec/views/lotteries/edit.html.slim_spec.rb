require 'rails_helper'

RSpec.describe "lotteries/edit", type: :view do
  let(:lottery) {
    Lottery.create!(
      name_field_enabled: false,
      note_field_enabled: false
    )
  }

  before(:each) do
    assign(:lottery, lottery)
  end

  it "renders the edit lottery form" do
    render

    assert_select "form[action=?][method=?]", lottery_path(lottery), "post" do

      assert_select "input[name=?]", "lottery[name_field_enabled]"

      assert_select "input[name=?]", "lottery[note_field_enabled]"
    end
  end
end
