# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :c2c_bff, C2cBffWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "txPGf8iKB+aKX4oL3+Im5OsuvMNAkfFa3PLzbdWU9Y7eAh1kBMZhjGxFmKbVHzr3",
  render_errors: [view: C2cBffWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: C2cBff.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message ",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
