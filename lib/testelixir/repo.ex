defmodule Elixir.Testelixir.Repo do
  use Ecto.Repo,
    otp_app: :testelixir,
    adapter: Ecto.Adapters.Postgres

  require Logger

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    Logger.info("DATABASE_URL: #{inspect(System.get_env("DATABASE_URL"))}")
    Logger.info("DATABASE_HOSTNAME: #{inspect(System.get_env("DATABASE_HOSTNAME"))}")
    Logger.info("DATABASE_PORT: #{inspect(System.get_env("DATABASE_PORT"))}")
    Logger.info("DATABASE_USERNAME: #{inspect(System.get_env("DATABASE_USERNAME"))}")
    Logger.info("DATABASE_PASSWORD: #{inspect(System.get_env("DATABASE_PASSWORD"))}")
    Logger.info("DATABASE_NAME: #{inspect(System.get_env("DATABASE_NAME"))}")

    case System.get_env("DATABASE_URL") do
      nil ->
        opts =
          case System.get_env("DATABASE_HOSTNAME") do
            nil ->
              opts

            hostname ->
              Keyword.put(opts, :hostname, hostname)
          end

        opts =
          case System.get_env("DATABASE_PORT") do
            nil ->
              opts

            port ->
              Keyword.put(opts, :port, port)
          end

        opts =
          case System.get_env("DATABASE_USERNAME") do
            nil ->
              opts

            username ->
              Keyword.put(opts, :username, username)
          end

        opts =
          case System.get_env("DATABASE_PASSWORD") do
            nil ->
              opts

            password ->
              Keyword.put(opts, :password, password)
          end

        opts =
          case System.get_env("DATABASE_NAME") do
            nil ->
              opts

            database ->
              Keyword.put(opts, :database, database)
          end

        Logger.info("connect to 1 #{inspect(opts)}")
        {:ok, opts}

      url ->
        Logger.info("connect to 2 #{url}")
        {:ok, Keyword.put(opts, :url, url)}
    end
  end
end
