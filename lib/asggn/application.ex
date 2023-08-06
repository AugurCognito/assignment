defmodule Asggn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AsggnWeb.Telemetry,
      # Start the Ecto repository
      Asggn.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Asggn.PubSub},
      # Start Finch
      {Finch, name: Asggn.Finch},
      # Start the Endpoint (http/https)
      AsggnWeb.Endpoint
      # Start a worker by calling: Asggn.Worker.start_link(arg)
      # {Asggn.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Asggn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AsggnWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
