use Mix.Config

config :pow_last_login, :pow,
  user: PowLastLogin.Test.Users.User,
  repo: PowLastLogin.Test.Ecto.Repo,
  routes_backend: PowLastLogin.TestWeb.Phoenix.Routes,
  extensions: [PowLastLogin],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks

config :pow_last_login, PowLastLogin.Test.Ecto.Repo,
  database: "pow_last_login_test",
  username: "postgres",
  password: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox,
  priv: "test/support/ecto/priv"

config :pow_last_login, PowLastLogin.TestWeb.Phoenix.Endpoint,
  secret_key_base: String.duplicate("abcdefghijklmnopqrstuvxyz0123456789", 2),
  render_errors: [view: PowLastLogin.TestWeb.Phoenix.ErrorView, accepts: ~w(html json)]

config :phoenix, :json_library, Jason
