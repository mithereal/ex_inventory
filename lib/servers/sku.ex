defmodule ExInventory.Servers.Sku do
  @moduledoc """
  A GenServer instance that runs for every `ExInventory.Schemas.Sku` to keep track
  of live data, like the total quantity of parts that are available to pick,
  and the total quantity that is demanded by builds.
  """

  use GenServer, restart: :transient

  require Logger

  def start_link(%Schemas.Sku{} = sku) do
    GenServer.start_link(__MODULE__, sku, name: name(sku))
  end

  defp name(%Schemas.Sku{id: id}), do: name(id)
  defp name(id), do: {:via, Registry, {ExInventory.SkuRegistry, to_string(id)}}

  @impl true
  def init(%Schemas.Sku{} = sku) do
  end
end
