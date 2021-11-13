Mailjet.configure do |config|
  config.api_key = Rails.application.secrets[:api_key]
  config.secret_key = Rails.application.secrets[:secret_key]
  config.default_from = Rails.application.secrets[:sender]
  config.api_version = 'v3.1'
end
