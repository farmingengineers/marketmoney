require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid_connect,
    :name => "google",
    :scope => [:email],
    :client_options => {
      :identifier => ENV["GOOGLE_CLIENT_ID"],
      :secret => ENV["GOOGLE_CLIENT_SECRET"],
      :host => "accounts.google.com",
      :redirect_uri => ENV["GOOGLE_OPENID_REDIRECT_URL"] || "http://localhost:3030/auth/google/callback",
      :authorization_endpoint => "/o/oauth2/auth",
      :token_endpoint => "/o/oauth2/token",
      :userinfo_endpoint => "https://www.googleapis.com/plus/v1/people/me/openIdConnect",
    },
    :issuer => "https://accounts.google.com",
    :send_nonce => false
end
