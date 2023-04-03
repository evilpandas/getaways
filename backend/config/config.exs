# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :cors_plug,
  origin: ["http://localhost:3000"],
  max_age: 86400,
  methods: ["GET", "POST"]

config :getaways,
  ecto_repos: [Getaways.Repo]

# Configures the endpoint
config :getaways, GetawaysWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r/KECNh6PcQMEwqy78veF/hGvvy+MAiOa9fL2tbURvl4D4K3FZiF4p8zwesH9+dW",
  render_errors: [
    formats: [json: GetawaysWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Getaways.PubSub,
  live_view: [signing_salt: "uR4v07ml"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :getaways, Getaways.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
