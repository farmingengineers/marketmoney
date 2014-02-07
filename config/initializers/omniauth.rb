require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid,
    :store => OpenID::Store::Filesystem.new('./tmp'),
    :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end
