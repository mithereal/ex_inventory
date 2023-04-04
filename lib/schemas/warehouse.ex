defmodule ExInventory.Schemas.Warehouse do
  use ExInventory.Schema



  alias ExInventory.Schemas.Warehouse.Location, as: WAREHOUSE_LOCATION
#  alias ExInventory.Schemas.Item.Location, as: ITEM_LOCATION

  schema "inventory_warehouses" do
    field(:title, :string)

    belongs_to(:location, WAREHOUSE_LOCATION)
  #  has_many(:items, Item, through: ITEM_LOCATION)

    timestamps()
  end
end
