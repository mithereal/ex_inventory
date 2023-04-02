defmodule ExInventory.Schemas.Item.Location do
  use Ecto.Schema

  alias ExInventory.Schemas.Item

  schema "inventory_item_locations" do
    field :title, :string

    belongs_to :items, Item

    timestamps()
  end
end