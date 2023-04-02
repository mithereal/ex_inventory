defmodule ExInventory.Servers.Sku do
  @moduledoc """
  A GenServer instance that runs for every `ExInventory.Schemas.Sku` to keep track
  of live data, like the total quantity of parts that are available to pick,
  and the total quantity that is demanded by builds.
  """

  alias ExInventory.Schemas.Sku

  use GenServer, restart: :transient

  require Logger

  def start_link(%Sku{} = sku) do
    GenServer.start_link(__MODULE__, sku, name: name(sku))
  end

  defp name(%Sku{id: id}), do: name(id)
  defp name(id), do: {:via, Registry, {ExInventory.SkuRegistry, to_string(id)}}

  @impl true
  def init(%Sku{} = sku) do
  end
end
