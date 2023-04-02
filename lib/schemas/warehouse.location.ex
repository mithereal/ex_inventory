defmodule ExInventory.Schemas.Warehouse.Location do
  use ExInventory.Schema, type: ExInventory.Config.key_type()

  alias ExInventory.Schemas.Warehouse

  schema "inventory_warehouse_locations" do
    field(:title, :string)

    has_one(:warehouse, Warehouse)

    timestamps()
  end
end
