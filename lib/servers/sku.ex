defmodule ExInventory.Servers.Sku do
  @moduledoc """
  A GenServer instance that runs for every `ExInventory.Schemas.Sku` to keep track
  of live data, like the total quantity of parts that are available to pick,
  and the total quantity that is demanded by builds.
  """
  use GenServer, restart: :transient

  require Logger

  alias ExInventory.Schemas.Sku
  alias ExInventory.Schemas.Item

  def child_spec(init) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [init]},
      restart: :transient,
      type: :worker
    }
  end

  def start_link([sku]) do
    GenServer.start_link(__MODULE__, sku, name: name(sku))
  end

  defp name(%Sku{sku: id}), do: name(id)
  defp name(id), do: {:via, Registry, {ExInventory.SkuRegistry, to_string(id)}}

  @impl true
  def init(_) do
    ## start links to items
    {:ok, __MODULE__}
  end

  def load_item_state_by_quantity(item) do
    item.quantity_on_hand
    |> Enum.each(fn x ->
      Registry.register(:on_hand, item.sku, item.sku)
    end)

    item.quantity_on_backorder
    |> Enum.each(fn x ->
      Registry.register(:on_backorder, item.sku, item.sku)
    end)

    item.quantity_in_transit
    |> Enum.each(fn x ->
      Registry.register(:in_transit, item.sku, item.sku)
    end)
  end
end
