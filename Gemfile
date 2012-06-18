source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  #gem 'sqlite3'
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

group :test, :development do
  # gem "rspec-rails", "~> 2.8"
  gem "cucumber-rails", :require => false
  gem "database_cleaner" 
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'tinymce-rails'
gem "paperclip", "~> 2.0"
gem 'rails-i18n'
gem 'validates_email_format_of', :git => 'git://github.com/alexdunae/validates_email_format_of.git'
gem 'devise'
gem 'cancan'
gem 'rolify'
gem 'workflow'
gem 'devise-i18n'
gem 'i18n_routing'




# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
