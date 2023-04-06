defmodule ExInventory.Servers.Item do
  @moduledoc """
  A GenServer instance that runs for every `ExInventory.Schemas.Item` to keep track
  of live data, like the total quantity of parts that are available to pick,
  and the total quantity that is demanded by builds.
  """
  use GenServer, restart: :transient

  require Logger

  alias ExInventory.Schemas.Item

  def child_spec(init) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [init]},
      restart: :transient,
      type: :worker
    }
  end

  def start_link([item]) do
    GenServer.start_link(__MODULE__, item, name: name(item))
  end

  defp name(%Item{} = schema), do: item(schema)
  defp item(schema), do: {:via, Registry, {ExInventory.SkuRegistry, to_string(schema.id)}}

  @impl true
  def init(item) do

    {:ok, __MODULE__}
  end

  def load_item_state_by_quantity(pid, item) do
    item.quantity_on_hand
    |> Enum.each(fn x ->
      Registry.register(pid, :on_hand, item.sku, item.sku)
    end)

    item.quantity_on_backorder
    |> Enum.each(fn x ->
      Registry.register(pid,:on_backorder, item.sku, item.sku)
    end)

    item.quantity_in_transit
    |> Enum.each(fn x ->
      Registry.register(pid, :in_transit, item.sku, item.sku)
    end)
  end
end
