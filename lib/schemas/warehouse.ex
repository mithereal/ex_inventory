defmodule ExInventory.Schemas.Warehouse do
  use Ecto.Schema

  alias ExInventory.Schemas.Item
  alias ExInventory.Schemas.Warehouse.Location, WAREHOUSELOCATION
  alias ExInventory.Schemas.Items.Location, ITEMSLOCATION

  schema "inventory_warehouses" do
    field(:title, :string)

    belongs_to(:location, WAREHOUSELOCATION)
    has_many(:items, Item, through: ITEMSLOCATION)

    timestamps()
  end
end
