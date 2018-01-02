# By placing all of Spree's shared dependencies in this file and then loading
# it for each component's Gemfile, we can be sure that we're only testing just
# the one component of Spree.
source 'https://rubygems.org'

gem 'coffee-rails'
gem 'polyamorous', :git => 'https://github.com/spark-solutions/polyamorous.git' # temporary hack to make it work with rails 5.2.0
gem 'awesome_nested_set', :git => 'https://github.com/spark-solutions/awesome_nested_set' # temporary hack to make it work with rails 5.2.0
gem 'friendly_id', :git => 'https://github.com/norman/friendly_id' # temporary hack to make it work with rails 5.2.0
gem 'acts_as_list', :git => 'https://github.com/swanandp/acts_as_list' # temporary hack to make it work with rails 5.2.0
gem 'sass-rails'
gem 'sqlite3', platforms: [:ruby, :mingw, :mswin, :x64_mingw]
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

platforms :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcsqlite3-adapter'
end

platforms :ruby do
  gem 'mysql2'
  gem 'pg'
end

group :test do
  gem 'capybara', '~> 2.16'
  gem 'capybara-screenshot', '~> 1.0'
  gem 'database_cleaner', '~> 1.3'
  gem 'email_spec'
  gem 'factory_bot_rails', '~> 4.8'
  gem 'launchy'
  gem 'rspec-activemodel-mocks', '~> 1.0'
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'rspec-rails', '~> 3.7.2'
  gem 'rspec-retry'
  gem 'rspec_junit_formatter'
  gem 'simplecov'
  gem 'webmock', '~> 3.0.1'
  gem 'poltergeist', '~> 1.10'
  gem 'timecop'
  gem 'rails-controller-testing'
  gem 'versioncake', :git => 'https://github.com/spark-solutions/versioncake.git' # temporary hack to make it work with rails 5.2.0
  gem 'ransack', :git => 'https://github.com/spark-solutions/ransack.git' # temporary hack to make it work with rails 5.2.0
end

group :test, :development do
  gem 'rubocop', require: false
  gem 'pry-byebug'
end
