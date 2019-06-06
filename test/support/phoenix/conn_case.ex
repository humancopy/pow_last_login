defmodule PowLastLogin.TestWeb.Phoenix.ConnCase do
  @moduledoc false
  use ExUnit.CaseTemplate
  alias Phoenix.ConnTest
  alias PowLastLogin.TestWeb.Phoenix.{Endpoint, Router}

  alias Ecto.Adapters.SQL.Sandbox
  alias PowLastLogin.Test.Ecto.Repo

  using do
    quote do
      use ConnTest

      alias Router.Helpers, as: Routes

      @endpoint Endpoint
    end
  end

  setup do
    :ok = Sandbox.checkout(Repo)
    Sandbox.mode(Repo, {:shared, self()})

    conn = ConnTest.build_conn()
    opts = Plug.Session.init(store: :cookie, key: "_binaryid_key", signing_salt: "secret")

    conn =
      conn
      |> Plug.Session.call(opts)
      |> Plug.Conn.fetch_session()

    {:ok, conn: conn}
  end
end
