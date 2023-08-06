require 'rails_helper'

RSpec.describe "lotteries/show", type: :view do
  before(:each) do
    assign(:lottery, Lottery.create!(
      name_field_enabled: false,
      note_field_enabled: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
