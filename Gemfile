source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "3.0.4"

gem "active_storage_validations", "0.9.5"
gem "bcrypt", "~>3.1.13"
gem "bootsnap", ">= 1.4.4", require: false
gem "bootstrap-sass", "~>3.4.1"
gem "config"
gem "faker", "2.22.0"
gem "figaro"
gem "i18n-js"
gem "image_processing", "1.12.0"
gem "jbuilder", "~> 2.7"
gem "mini_magick", "4.10.0"
gem "mysql2", "~> 0.5"
gem "pagy"
gem "parser", ">= 2.6"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.6", ">= 6.1.6.1"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  gem "webdrivers"
end

group :development, :test do
  gem "pry-rails", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
