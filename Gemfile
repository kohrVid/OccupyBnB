    source 'https://rubygems.org'

    ruby '>= 2.4.0'
    gem 'rails', '~> 5.2.0'
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
    gem 'sprockets', '>=3.0.0.beta'
    #gem 'sprockets-es6'
    gem 'haml'
    gem 'nokogiri'
    gem 'devise', git: 'https://github.com/plataformatec/devise.git', branch: 'master'
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
    gem 'elasticsearch-model', '0.1.9'
    gem 'elasticsearch-rails', '0.1.9'
    gem 'elasticsearch', '2.0'
    gem 'searchkick', '1.3.3'
    gem 'cocoon'
    gem 'owlcarousel-rails'

    # Use Capistrano for deployment
     gem 'capistrano-rails', group: :development

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
      gem 'rails_12factor'
      gem 'aws-sdk'
    end
