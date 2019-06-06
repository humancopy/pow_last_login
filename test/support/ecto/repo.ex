defmodule PowLastLogin.Test.Ecto.Repo do
  @moduledoc false
  use Ecto.Repo, otp_app: :pow_last_login, adapter: Ecto.Adapters.Postgres

  def log(_cmd), do: nil
end