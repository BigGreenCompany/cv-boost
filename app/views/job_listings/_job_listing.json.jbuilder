json.extract! job_listing, :id, :user_id, :title, :employer, :location, :job_type, :description, :created_at, :updated_at
json.url job_listing_url(job_listing, format: :json)
