defmodule ExInventory.Schemas.Warehouse do
  use ExInventory.Schema, type: ExInventory.Config.key_type()



  alias ExInventory.Schemas.Warehouse.Location, as: WAREHOUSE_LOCATION
#  alias ExInventory.Schemas.Items.Location, as: ITEMS_LOCATION

  schema "inventory_warehouses" do
    field(:title, :string)

    belongs_to(:location, WAREHOUSE_LOCATION)
  #  has_many(:items, Item, through: ITEMS_LOCATION)

    timestamps()
  end
end
