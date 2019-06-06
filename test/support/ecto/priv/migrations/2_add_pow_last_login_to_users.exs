defmodule PowLastLogin.Test.Repo.Migrations.AddPowLastLoginToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :current_login_at, :utc_datetime
      add :current_login_from, :string
      add :last_login_at, :utc_datetime
      add :last_login_from, :string
    end

  end
end
