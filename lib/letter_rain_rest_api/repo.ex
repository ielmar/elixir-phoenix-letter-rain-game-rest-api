defmodule LetterRainRestApi.Repo do
  use Ecto.Repo,
    otp_app: :letter_rain_rest_api,
    adapter: Ecto.Adapters.SQLite3
end
