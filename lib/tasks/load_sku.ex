defmodule ExInventory.Tasks.Skus.Load do
  use Task
  require Logger

  alias ExInventory.Schemas.Sku

  @moduledoc false

  def start_link(_data \\ []) do
    Logger.info("Load Skus.")
    Task.start_link(&load/0)
  end

  defp load() do
    receive do
    after
      3000 ->
        ExInventory.skus()
        |> Enum.each(fn x -> nil
        ## load skus into registry, then we decide if there are items, and if so start genserverts and register based on quantity
        end)
    end
  end
end
