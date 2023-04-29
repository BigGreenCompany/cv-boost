
require 'airbrake-ruby'

Airbrake.configure do |c|
  c.project_id = Rails.application.credentials.dig(:airbrake, :project_id)
  c.project_key = Rails.application.credentials.dig(:airbrake, :project_key)
  c.environment = Rails.env.to_sym
  c.ignore_environments = [:development, :test]
end
