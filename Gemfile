source 'https://rubygems.org'

# Ruby version
ruby '2.4.0'

gem 'activerecord', '~> 5.0', '>= 5.0.0.1'
gem 'mysql2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debug console
  gem 'byebug'
  gem 'dotenv'
  gem 'overcommit'
  gem 'reek'
  gem 'rubocop', require: false
end

group :test do
  gem 'guard-rspec', require: false
  gem 'rspec'
end
