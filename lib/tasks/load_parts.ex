defmodule ExInventory.Tasks.Parts.Load do
  use Task
  require Logger

  @moduledoc false

  def start_link(_data \\ []) do
    Logger.info("Loading Parts.")
    Task.start_link(&load/0)
  end

  defp load() do
    receive do
    after
      3000 ->
        ExInventory.serials()
        |> Enum.each(fn x ->
          ExInventory.part_by_serial(x)
          |> ExInventory.Part.Supervisor.start_child()
          |> register_parts_by_quantity()
        end)
    end
  end

  def register_parts_by_quantity({pid, part}) do
    part.quantity.on_hand
    |> Enum.each(fn x ->
      Registry.register(pid, :on_hand, part.serial_number, part.serial_number)
    end)

    part.quantity.on_backorder
    |> Enum.each(fn x ->
      Registry.register(pid, :on_backorder, part.serial_number, part.serial_number)
    end)

    part.quantity.in_transit
    |> Enum.each(fn x ->
      Registry.register(pid, :in_transit, part.serial_number, part.serial_number)
    end)

    part.quantity.reserved
    |> Enum.each(fn x ->
      Registry.register(pid, :reserved, part.serial_number, part.serial_number)
    end)
  end
end
