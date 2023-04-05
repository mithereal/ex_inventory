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
  defp item(schema), do: {:via, Registry, registry(schema)}

  defp registry(schema) do
    case schema.quantity do
      _-> {ExInventory.SkuRegistry, to_string(schema.id)}
    end
  end

  @impl true
  def init(_) do
    ## start links to items
    {:ok, __MODULE__}
  end
end
