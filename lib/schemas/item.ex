defmodule ExInventory.Schemas.Item do
  use ExInventory.Schema, type: ExInventory.Config.key_type()

  @moduledoc """
  The basic unit of inventory. every item can be in a registry by status on_hand etc
  """

  alias ExInventory.Schemas.Sku
  alias ExInventory.Schemas.Item.Location

  schema "inventory_items" do
    field(:title, :string)
    field(:sub_title, :string)
    field(:description, :string)

    field(:quantity_on_hand, :integer)
    field(:quantity_on_backorder, :integer)
    field(:quantity_in_transit, :integer)

    belongs_to(:sku, Sku)
    belongs_to(:location, Location)
  end
end
