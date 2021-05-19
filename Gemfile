source 'https://rubygems.org'

ruby '2.6.7'

# rails
gem 'rails', '5.2.4.3'

# asset pipeline
gem 'jquery-rails', '4.1.1'
gem 'sass-rails', '5.0.7' # deprecated, will need to use dart sass or sassc.
gem 'uglifier', '>= 1.3.0'

# everything else
gem 'dotenv'
gem 'haml-rails'
gem 'omniauth', '1.4.3'
gem 'omniauth-google-oauth2', '0.2.10'
gem 'unicorn'

# not production
group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '3.8.0'
  gem 'sqlite3'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'factory_bot_rails', '4.10.0'
end


# production
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
