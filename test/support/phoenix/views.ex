defmodule PowLastLogin.TestWeb.Phoenix.LayoutView do
  @moduledoc false
  use Phoenix.View,
    root: "test/support/phoenix/templates",
    namespace: PowLastLogin.TestWeb.Phoenix
end

defmodule PowLastLogin.TestWeb.Phoenix.ErrorView do
  @moduledoc false
  def render("500.html", _assigns), do: "500.html"
  def render("400.html", _assigns), do: "400.html"
  def render("404.html", _assigns), do: "404.html"
end
