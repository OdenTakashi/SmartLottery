require 'rails_helper'

RSpec.describe "lotteries/index", type: :view do
  before(:each) do
    assign(:lotteries, [
      Lottery.create!(
        name_field_enabled: false,
        note_field_enabled: false
      ),
      Lottery.create!(
        name_field_enabled: false,
        note_field_enabled: false
      )
    ])
  end

  it "renders a list of lotteries" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
