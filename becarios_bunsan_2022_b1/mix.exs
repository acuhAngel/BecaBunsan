defmodule BecariosBunsan2022B1.MixProject do
  use Mix.Project

  def project do
    [
      app: :becarios_bunsan_2022_b1,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:sweet_xml, "~> 0.7.2"},
      {:libgraph, "~> 0.13.3"},
      {:tzdata, "~> 1.1"}
    ]
  end
end
