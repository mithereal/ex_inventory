defmodule ExInventory.Schemas.Warehouse do
  use Ecto.Schema

  alias ExInventory.Schemas.Item

  schema "inventory_warehouses" do
    field(:title, :string)

    belongs_to(:location, Location)
    has_many(:items, Item, through: Location)

    timestamps()
  end
end
