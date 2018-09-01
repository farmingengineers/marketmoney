source 'https://rubygems.org'

ruby '2.4.4'

# rails
gem 'rails', '4.2.10'

# asset pipeline
gem 'coffee-rails', '4.1.1'
gem 'jquery-rails', '4.0.5'
gem 'sass-rails', '5.0.7' # deprecated, will need to use dart sass or sassc.
gem 'uglifier', '>= 1.3.0'

# everything else
gem 'dotenv'
gem 'haml-rails'
gem 'omniauth-google-oauth2'
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
  gem 'factory_girl_rails'
end


# production
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
