defmodule ExInventory.Schemas.Warehouse do
  use ExInventory.Schema

  alias ExInventory.Schemas.Warehouse.Properties
  #  alias ExInventory.Schemas.Item.Location, as: ITEM_LOCATION

  schema "inventory_warehouses" do
    field(:title, :string)
    field(:location, :string)

    #  has_many(:items, Item, through: ITEM_LOCATION)

    timestamps()
  end
end
