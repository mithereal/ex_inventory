defmodule ExInventory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  def start(_type, args) do
    repo = ExInventory.Config.repo()

    children =
      [
        {repo, args},
        {Registry, keys: :duplicate, name: :on_hand},
        {Registry, keys: :duplicate, name: :back_ordered},
        {Registry, keys: :duplicate, name: :in_transit},
        {DynamicSupervisor, name: ExInventory.SkuSupervisor, strategy: :one_for_one}
      ]
      |> maybe_autoload_exchange_rates()

    opts = [strategy: :one_for_one, name: ExInventory.Supervisor]

    Supervisor.start_link(children, opts)
    |> load_skus()
  end

  @version Mix.Project.config()[:version]
  def version, do: @version

  @doc """
  Add a currency to the application and load into ets
  """
  def add_currency(params) do
    ExInventory.Currencies.new(params)
  end

  defp maybe_autoload_exchange_rates(children) do
    autoload = Application.get_env(:ex_inventory, :autoload_exchange_rates, false)

    data =
      if(autoload == true) do
        [
          {Cldr.Currency, [callback: {ExInventory.Currencies, :init, []}]},
          {ExInventory.Tasks.Currency.Reload, name: ExInventory.Tasks.Currency.Reload}
        ]
      else
        []
      end

    children ++ data
  end

  defp load_skus(params) do
    ExInventory.Tasks.Skus.Load.start_link()
    params
  end
end
