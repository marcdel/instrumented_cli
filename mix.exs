defmodule InstrumentedCLI.MixProject do
  use Mix.Project

  def project do
    [
      app: :instrumented_cli,
      version: "0.1.0",
      elixir: "~> 1.14",
      releases: [
        instrumented_cli: [applications: [opentelemetry_exporter: :permanent, opentelemetry: :temporary]]
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {InstrumentedCLI.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:open_telemetry_decorator, "~> 1.4"},
      {:opentelemetry_api, "~> 1.2"},
      {:opentelemetry_exporter, "~> 1.4"},
      {:opentelemetry, "~> 1.3"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
