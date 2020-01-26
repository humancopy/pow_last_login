defmodule PowLastLogin do
  @moduledoc false
  use Pow.Extension.Base

  @impl true
  def ecto_schema?(), do: true

  @impl true
  def phoenix_controller_callbacks?(), do: true
end
