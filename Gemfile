source 'https://rubygems.org/'

# Framework
gem 'sinatra'
gem 'sinatra-contrib'
# gem 'sinatra-assetpack', :require => 'sinatra/assetpack'

# Assets
# gem 'json' # Doesn't work on production: 'oj'
# gem 'therubyracer'
# gem 'uglifier'
# gem 'less', '~>2.3.2'

group :development do
  gem 'thin'
  gem 'rake'

  gem 'capistrano'
  gem 'rvm-capistrano', '~>1.2.0'
  gem 'pry'
end

group :test do
  gem 'rspec'
end

group :development, :test do
  gem 'rake'
end