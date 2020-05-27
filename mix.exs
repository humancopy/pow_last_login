defmodule PowLastLogin.MixProject do
  use Mix.Project

  @version "0.1.2"

  def project do
    [
      app: :pow_last_login,
      version: @version,
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps(),

      # Hex
      description: "A Pow extension to track the time and IP a user logged in from",
      package: package(),

      # Docs
      name: "PowLastLogin",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:pow, "~> 1.0"},
      {:ecto, "~> 2.2 or ~> 3.0"},
      {:phoenix, ">= 1.3.0 and < 1.6.0"},
      {:phoenix_html, ">= 2.0.0 and <= 3.0.0"},
      {:phoenix_ecto, "~> 4.0.0", only: [:dev, :test]},
      {:credo, "~> 0.9.3", only: [:dev, :test]},
      {:ex_doc, "~> 0.19.0", only: :dev},
      {:ecto_sql, "~> 3.0.0", only: [:test]},
      {:jason, "~> 1.0", only: [:test]},
      {:postgrex, "~> 0.14.0", only: [:test]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["humancopy"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/humancopy/pow_last_login"},
      files: ~w(lib LICENSE mix.exs README.md)
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      canonical: "http://hexdocs.pm/pow_last_login",
      source_url: "https://github.com/humancopy/pow_last_login",
      extras: [
        "README.md": [filename: "readme", title: "PowLastLogin"]
      ],
      groups_for_modules: [
        Ecto: ~r/^PowLastLogin.Ecto/,
        Phoenix: ~r/^PowLastLogin.Phoenix/
      ]
    ]
  end
end
