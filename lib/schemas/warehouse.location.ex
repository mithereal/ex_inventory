defmodule ExInventory.Schemas.Warehouse.Location do
  use ExInventory.Schema

  alias ExInventory.Schemas.Warehouse

  schema "inventory_warehouse_locations" do
    field(:title, :string)

    has_one(:warehouse, Warehouse)

    timestamps()
  end
end
