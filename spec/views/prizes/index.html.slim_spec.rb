require 'rails_helper'

RSpec.describe "prizes/index", type: :view do
  before(:each) do
    assign(:prizes, [
      Prize.create!(
        name: "Name",
        winners_count: 2,
        winning_email_subject: "Winning Email Subject",
        winning_email_body: "Winning Email Body"
      ),
      Prize.create!(
        name: "Name",
        winners_count: 2,
        winning_email_subject: "Winning Email Subject",
        winning_email_body: "Winning Email Body"
      )
    ])
  end

  it "renders a list of prizes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Winning Email Subject".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Winning Email Body".to_s), count: 2
  end
end
