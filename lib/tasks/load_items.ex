defmodule ExInventory.Tasks.Items.Load do
  use Task
  require Logger

  @moduledoc false

  def start_link(_data \\ []) do
    Logger.info("Loading Items.")
    Task.start_link(&load/0)
  end

  defp load() do
    receive do
    after
      3000 ->
        ExInventory.skus()
        |> Enum.each(fn x ->
          ExInventory.item_by_sku(x)
          |> ExInventory.Item.Supervisor.start_child()
          |> register_items_by_quantity()
        end)
    end
  end


  def register_items_by_quantity({pid, item}) do
    item.quantity_on_hand
    |> Enum.each(fn x ->
      Registry.register(pid, :on_hand, item.sku, item.sku)
    end)

    item.quantity_on_backorder
    |> Enum.each(fn x ->
      Registry.register(pid, :on_backorder, item.sku, item.sku)
    end)

    item.quantity_in_transit
    |> Enum.each(fn x ->
      Registry.register(pid, :in_transit, item.sku, item.sku)
    end)
  end
end
