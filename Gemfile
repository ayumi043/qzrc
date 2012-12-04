source 'http://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'sqlite3', :group => [:development, :test]
group :production do
  gem 'thin'
  gem 'pg'
end

gem 'pg'
gem 'thin'


# gem 'mysql2'



# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 3.2.3'
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
gem 'debugger'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

gem 'execjs'
gem 'therubyracer'

gem "kaminari"  #分页插件

gem 'redis', '2.2.2'

gem 'nokogiri'

gem 'rb-readline'

gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS


gem 'thinking-sphinx'

gem 'pry'
gem 'pry-remote'

gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-douban-oauth2'
gem 'omniauth-identity'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'
