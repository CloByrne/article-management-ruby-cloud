require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ArticleManagement
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.public_file_server.enabled = true

    # Allow cross-origin resource sharing (CORS)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins do |origin, _|
          if Rails.env.development?
            # Replace with your EC2 instance URL
            origin =~ /https:\/\/52\.16\.53\.86/
          else
            # Allow requests from localhost:3001 when running locally
            origin =~ /http:\/\/localhost:3001/
          end
        end
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  end
end
