json.extract! ai_message, :id, :experience_id, :role, :content, :created_at, :updated_at
json.url experience_ai_message_url(ai_message, format: :json)
