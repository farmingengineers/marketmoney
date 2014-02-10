# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Ensure all customers have slugs"
task :slugs => :environment do
  Customer.all.each do |customer|
    customer.slug_me!
  end
end
