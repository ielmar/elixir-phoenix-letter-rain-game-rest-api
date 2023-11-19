defmodule LetterRainRestApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LetterRainRestApiWeb.Telemetry,
      # Start the Ecto repository
      LetterRainRestApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LetterRainRestApi.PubSub},
      # Start Finch
      {Finch, name: LetterRainRestApi.Finch},
      # Start the Endpoint (http/https)
      LetterRainRestApiWeb.Endpoint
      # Start a worker by calling: LetterRainRestApi.Worker.start_link(arg)
      # {LetterRainRestApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LetterRainRestApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LetterRainRestApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
