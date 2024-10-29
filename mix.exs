defmodule BambooSmtp.Mixfile do
  use Mix.Project

  @project_url "https://github.com/fewlinesco/bamboo_smtp"
  @version "4.2.2"

  def project do
    [
      app: :bamboo_smtp,
      version: @version,
      elixir: "~> 1.17",  # Actualizado para reflejar la versión de Elixir 1.17
      source_url: @project_url,
      homepage_url: @project_url,
      name: "Bamboo SMTP Adapter",
      description: "A Bamboo adapter for SMTP",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [applications: [:gen_smtp, :logger, :bamboo]]
  end

  defp deps do
    [
      # core
      {:bamboo, "~> 2.3.0"},
      {:gen_smtp, "~> 1.2.0"},
      # dev / test
      {:credo, "~> 1.7.2", only: [:dev, :test]},
      {:excoveralls, "~> 0.15.0", only: :test},
      # doc
      {:earmark, ">= 1.4.20", only: :docs},
      {:ex_doc, ex_doc_version(), only: :docs},
      {:inch_ex, "~> 2.0.0", only: :docs}
    ]
  end

  defp ex_doc_version do
    if Version.match?(System.version(), "~> 1.17") do
      "~> 0.29.0"
    else
      "~> 0.24.0"
    end
  end

  defp package do
    [
      maintainers: ["Kevin Disneur", "Thomas Gautier"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "#{@project_url}/blob/main/CHANGELOG.md",
        "GitHub" => @project_url
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      extras: ["README.md", "CHANGELOG.md": [title: "Changelog"]]
    ]
  end
end
