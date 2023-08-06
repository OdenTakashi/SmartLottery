require 'rails_helper'

RSpec.describe "lotteries/new", type: :view do
  before(:each) do
    assign(:lottery, Lottery.new(
      name_field_enabled: false,
      note_field_enabled: false
    ))
  end

  it "renders new lottery form" do
    render

    assert_select "form[action=?][method=?]", lotteries_path, "post" do

      assert_select "input[name=?]", "lottery[name_field_enabled]"

      assert_select "input[name=?]", "lottery[note_field_enabled]"
    end
  end
end
