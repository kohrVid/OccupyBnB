source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jquery-rails'
gem 'underscore-rails'
gem 'sprockets', '>=3.0.0.beta'
gem 'sprockets-es6'
gem 'ejs'
gem 'haml'
gem 'nokogiri'
gem 'devise', git: 'https://github.com/plataformatec/devise.git'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-instagram'
gem 'cancancan'
gem 'figaro'
gem 'humanize_boolean'
gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave'
gem 'mini_magick', '~> 3.8.0'
gem 'fog'
gem 'geocoder'
gem 'elasticsearch-model', git: 'https://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'https://github.com/elasticsearch/elasticsearch-rails.git'
gem 'searchkick'
gem 'cocoon'
gem 'ratyrate', git: 'https://github.com/wazery/ratyrate'

# Use Capistrano for deployment
 gem 'capistrano-rails'#, group: :development

group :test do
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'jasmine'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'aws-sdk'
end
