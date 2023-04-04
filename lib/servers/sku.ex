defmodule ExInventory.Servers.Sku do
  @moduledoc """
  A GenServer instance that runs for every `ExInventory.Schemas.Sku` to keep track
  of live data, like the total quantity of parts that are available to pick,
  and the total quantity that is demanded by builds.
  """
  use GenServer, restart: :transient

  require Logger

  alias ExInventory.Schemas.Sku

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
    {:ok, __MODULE__}
  end
end
