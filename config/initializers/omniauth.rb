require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid, OpenID::Store::Filesystem.new('./tmp')
end
