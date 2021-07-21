# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bramble_test,
  ecto_repos: [BrambleTest.Repo]

# Configures the endpoint
config :bramble_test, BrambleTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vzrideMmT/MlHTmG841Bo82sa7s35092OTsJyPvzq4afU09Wh3MBf8Wrtw/RgznT",
  render_errors: [view: BrambleTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BrambleTest.PubSub,
  live_view: [signing_salt: "Rk+IEOs2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
