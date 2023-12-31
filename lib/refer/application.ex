defmodule Refer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ReferWeb.Telemetry,
      # Start the Ecto repository
      Refer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Refer.PubSub},
      # Start Finch
      {Finch, name: Refer.Finch},
      {AshAuthentication.Supervisor, otp_app: :refer},
      # Start the Endpoint (http/https)
      ReferWeb.Endpoint
      # Start a worker by calling: Refer.Worker.start_link(arg)
      # {Refer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Refer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ReferWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
