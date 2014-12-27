Dotenv.load ".env.#{Rails.env}"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_OAUTH_ID"], ENV["GOOGLE_OAUTH_SECRET"],
    :name => "google"
end
