source 'https://rubygems.org'
ruby '2.5.0'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'bootsnap', require: false
gem 'rails' , '5.2.0.rc1'
gem "pg", "~> 0.18"
gem 'rubyzip', '~> 1.1.0'
gem 'axlsx', '2.1.0.pre'
gem 'axlsx_rails'
gem 'puma', group: [:development, :production]
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jbuilder'
gem 'simple_form'
gem 'friendly_id'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'bootstrap-datepicker-rails'
gem "simple-line-icons-rails"
gem "select2-rails"
gem 'devise_invitable'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'paper_trail'
gem 'pg_search'
gem 'kaminari'
gem 'devise'
gem 'paperclip'
gem 'pundit'
gem 'prawn'
gem 'prawn-table'
gem "gretel"
gem 'public_activity'
gem 'mina-whenever', require: false
gem 'mina-puma', require: false
gem 'listen', '~> 3.1.5'
gem 'figaro'
gem 'barby'
gem 'redis', '~> 3.2'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rspec-its'
  gem 'faker', '1.8.0'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem 'rack-mini-profiler'
gem 'memory_profiler'
gem 'bullet'
