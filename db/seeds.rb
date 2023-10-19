# frozen_string_literal: true

User.create!(email: 'user1@example.com', password: 'testtest', confirmed_at: Time.current)

lottery1 = Lottery.create!(
  {
    user_id: 1,
    name: 'サンプルの抽選会',
    description: 'XXX株式会社の提供で行われます。',
    name_field_enabled: false,
    note_field_enabled: false,
    deadline: Time.zone.today,
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
