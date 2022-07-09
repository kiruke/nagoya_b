json.extract! like_post, :id, :user_id, :post_id, :created_at, :updated_at
json.url like_post_url(like_post, format: :json)
