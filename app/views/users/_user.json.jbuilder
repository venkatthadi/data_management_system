json.extract! user, :id, :name, :usertype_id, :school_id, :created_at, :updated_at
json.url user_url(user, format: :json)
