Dotenv.load ".env.#{Rails.env}"

Rails.application.config.middleware.use OmniAuth::Builder do
  # Settings are here:
  #   https://console.cloud.google.com/project/api-project-304059965776
  #   then "APIs & Servics"
  #   then "Credentials"
  #   then look in the "OAuth 2.0 Client IDs" list.
  provider :google_oauth2, ENV["GOOGLE_OAUTH_ID"], ENV["GOOGLE_OAUTH_SECRET"],
    :name => "google"
end
