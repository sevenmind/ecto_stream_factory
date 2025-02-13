defmodule EctoStreamFactory.MixProject do
  use Mix.Project

  @project_url "https://github.com/ibarchenkov/ecto_stream_factory"
  @version "0.2.2"

  def project do
    [
      app: :ecto_stream_factory,
      version: @version,
      elixir: ">= 1.17.2",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases(),

      # Hex
      description: "A factory library for property-based and regular tests",
      package: package(),

      # Docs
      name: "EctoStreamFactory",
      docs: docs()
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
      {:stream_data, "~> 1.1.1"},
      {:ecto_sql, "~> 3.12", optional: true},
      {:postgrex, ">= 0.0.0", only: :test},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp docs do
    [
      source_url: @project_url,
      source_ref: "v#{@version}",
      extras: ["README.md", "CHANGELOG.md"],
      main: "readme"
    ]
  end

  defp package do
    [
      maintainers: ["Igor Barchenkov"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @project_url,
        "Documentation" => "https://hexdocs.pm/ecto_stream_factory",
        "Changelog" => "https://hexdocs.pm/ecto_stream_factory/changelog.html"
      }
    ]
  end
end
