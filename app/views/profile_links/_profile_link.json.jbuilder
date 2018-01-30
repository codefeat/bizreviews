json.extract! profile_link, :id, :user_id, :profile_review_id, :link_id, :link_url, :created_at, :updated_at
json.url profile_link_url(profile_link, format: :json)
