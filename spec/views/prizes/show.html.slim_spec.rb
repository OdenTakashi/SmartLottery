require 'rails_helper'

RSpec.describe "prizes/show", type: :view do
  before(:each) do
    assign(:prize, Prize.create!(
      name: "Name",
      winners_count: 2,
      winning_email_subject: "Winning Email Subject",
      winning_email_body: "Winning Email Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Winning Email Subject/)
    expect(rendered).to match(/Winning Email Body/)
  end
end
