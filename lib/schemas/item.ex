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

    belongs_to(:sku, Sku)
    has_one(:location, Location)
  end
end
