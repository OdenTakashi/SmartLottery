# frozen_string_literal: true

User.create!(email: 'user1@example.com', password: 'testtest', confirmed_at: Time.current)

lottery1 = Lottery.create!(
  {
    user_id: 1,
    name_field_enabled: false,
    note_field_enabled: false,
    deadline: '2023-9-1',
    prizes_attributes: [
      {
        name: 'サンプル賞品1',
        winners_count: 2,
        winning_email_subject: 'おめでとうございます',
        winning_email_body: '当選おめでとうございます'
      },
      {
        name: 'サンプル賞品2',
        winners_count: 3,
        winning_email_subject: 'ナイス',
        winning_email_body: 'おめでとうおめでとうです'
      }
    ]
  }
)

(1..6).each do |n|
  lottery1.entries.create!(
    email: "entry#{n}@example.com"
  )
end
