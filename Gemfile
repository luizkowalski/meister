source "https://rubygems.org"

gem "rails", "~> 8.0.1"
gem "propshaft"
gem "mysql2", "~> 0.5"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "graphql"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-graphql", require: false
end

group :development do
  gem "web-console"
end
gem "graphiql-rails", group: :development
