defmodule ExInventory.MixProject do
  use Mix.Project

  @version "1.5.3"
  @source_url "https://github.com/mithereal/ex_inventory"

  def project do
    [
      app: :ex_inventory,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      docs: docs(),
      aliases: aliases(),
      releases: [
        ex_inventory: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent]
        ]
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib",  "test/support"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExInventory.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 0.9.1", only: [:dev, :test], runtime: false},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 3.5"},
      {:ecto_sql, "~> 3.5"},
      {:ecto_soft_delete, ">= 0.0.0"},
      {:ex_money, "~> 5.12"},
      {:ex_money_sql, "~> 1.8"},
      {:paginator, "~> 1.2.0"},
      {:ecto_autoslug_field, "~> 3.0"},
      {:ex_machina, "~> 2.4", only: :test}
    ]
  end

  defp description do
    "E-commerce Inventory for Elixir."
  end

  defp package do
    # These are the default files included in the package
    [
      name: :ex_inventory,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Jason Clark"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "ExInventory",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end

  defp aliases do
    [
      c: "compile",
      test: [
        "ecto.drop --quiet",
        "ecto.create --quiet",
        "ecto.migrate --quiet",
        "test"
      ],
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      install: ["ExInventory.install", "ecto.setup"]
    ]
  end
end
