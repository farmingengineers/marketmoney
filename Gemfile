source 'https://rubygems.org'

ruby '2.1.0'

# rails
gem 'rails', '4.1.0.beta1'

# asset pipeline
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'

# everything else
gem 'haml-rails'
gem 'unicorn'


# not production
group :development, :test do
  gem 'byebug', :require => false
  gem 'debugger', :require => false
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :development do
  gem 'guard-rspec'
  gem 'spring'
end

group :test do
  gem 'factory_girl_rails'
end


# production
group :production do
  gem 'pg'
end
