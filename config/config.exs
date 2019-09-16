use Mix.Config

config :testelixir, Testelixir.Repo,
  database: "testelixir",
  username: "postgres",
  password: "postgres",
  hostname: "172.25.0.2"

config :testelixir, ecto_repos: [Testelixir.Repo]