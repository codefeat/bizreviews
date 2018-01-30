json.extract! invite, :id, :user_id, :recipient_id, :fname, :lname, :email, :token, :created_at, :updated_at
json.url invite_url(invite, format: :json)
