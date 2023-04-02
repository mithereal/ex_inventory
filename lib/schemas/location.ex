defmodule ExInventory.Schemas.Location do
  use Ecto.Schema

  alias ExInventory.Schemas.Item
  alias ExInventory.Schemas.Warehouse

  schema "inventory_locations" do
    field :title, :string

    has_many :items, Item
    has_one :warehouse, Warehouse

    timestamps()
  end
end
