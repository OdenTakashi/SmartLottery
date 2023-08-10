json.extract! entry, :id, :email, :name, :note, :created_at, :updated_at
json.url entry_url(entry, format: :json)
