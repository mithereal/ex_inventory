defmodule ExInventory.Sku.Supervisor do
  use DynamicSupervisor
  require Logger

  def child_spec([args]) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, args},
      type: :supervisor
    }
  end

  def start_child(params) do
    spec = {ExInventory.Servers.Sku, params}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def start_link do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  ## Server callbacks

  @impl true
  def init(args) do
    DynamicSupervisor.init(
      strategy: :one_for_one,
      extra_arguments: args
    )
  end
end
