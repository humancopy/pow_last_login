defmodule PowLastLogin.Phoenix.ControllerCallbacksTest do
  use PowLastLogin.TestWeb.Phoenix.ConnCase

  alias Pow.{Plug}
  alias PowLastLogin.Test.{Users.User, Ecto.Repo}

  @password "secret1234"

  describe "Pow.Phoenix.SessionController.create/2" do
    @valid_params  %{"email" => "test@example.com", "password" => @password}
    @create_params %{"email" => "test@example.com", "password" => @password, "confirm_password" => @password}

    test "sets current_login_from and current_login_at", %{conn: conn} do
      %User{}
      |> User.changeset(@create_params)
      |> Repo.insert()

      conn = post conn, Routes.pow_session_path(conn, :create, %{"user" => @valid_params})

      assert %{current_login_from: "127.0.0.1", current_login_at: current_login_at} = Plug.current_user(conn)
      refute current_login_at == nil
    end
  end
end
