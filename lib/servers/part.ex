defmodule ExInventory.Servers.Part do
  @moduledoc """
  A GenServer instance that runs for every `ExInventory.Schemas.Part` to keep track
  of live data, like the total quantity of parts that are available to pick,
  and the total quantity that is demanded by builds.
  """
  use GenServer, restart: :transient

  require Logger

  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Item

  def child_spec(init) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [init]},
      restart: :transient,
      type: :worker
    }
  end

  def start_link(sku) do
    GenServer.start_link(__MODULE__, sku, name: name(sku))
  end

  defp name(%Part{sku: id}), do: name(id)
  defp name(id), do: {:via, Registry, {ExInventory.Part.Registry, to_string(id)}}

  @impl true
  def init(init) do
    {:ok, init}
  end

  @impl true
  def handle_call(:get_info, _from, state) do
    {:reply, state, state}
  end
end
