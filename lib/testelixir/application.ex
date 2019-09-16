defmodule Testelixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Starts a worker by calling: Testelixir.Worker.start_link(arg)
      # {Testelixir.Worker, arg}
      supervisor(Testelixir.Repo, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testelixir.Supervisor]
    Logger.info("start...")
    main_supervisor = Supervisor.start_link(children, opts)

    Logger.info("MIGRATION start")
    Ecto.Migrator.up(
      Testelixir.Repo,
      20190916110000,
      Testelixir.Migrations.CreatePeople
    )
    Logger.info("MIGRATION end")

    main_supervisor
  end
end
