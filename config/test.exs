import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :letter_rain_rest_api, LetterRainRestApi.Repo,
  database: Path.expand("../letter_rain_rest_api_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :letter_rain_rest_api, LetterRainRestApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "GVnfYfACtD5xDtemPo+9m7IdG3/Y4vQiT7/FgRQFOdC4q63NY2B5LkwqeguURA2C",
  server: false

# In test we don't send emails.
config :letter_rain_rest_api, LetterRainRestApi.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
