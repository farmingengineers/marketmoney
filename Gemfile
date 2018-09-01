source 'https://rubygems.org'

ruby '2.2.0'

# rails
gem 'rails', '~> 4.1.14'

# asset pipeline
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'

# everything else
gem 'dotenv'
gem 'haml-rails'
gem 'omniauth-google-oauth2'
gem 'unicorn'

gem 'rake', '10.1.1'

# not production
group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '3.3.3'
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
