json.extract! prize, :id, :name, :winners_count, :winning_email_subject, :winning_email_body, :created_at, :updated_at
json.url prize_url(prize, format: :json)
