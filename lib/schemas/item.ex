defmodule ExInventory.Schemas.Item do
  use ExInventory.Schema

  @moduledoc """
  The basic unit of inventory. every item can be in a registry by status on_hand etc
  """

  alias ExInventory.Schemas.Sku
  alias ExInventory.Schemas.Component
  alias ExInventory.Schemas.Location
  alias ExInventory.Schemas.Item.Properties

  schema "inventory_items" do
    field(:title, :string)
    field(:sub_title, :string)
    field(:description, :string)

    field(:quantity_on_hand, :integer)
    field(:quantity_on_backorder, :integer)
    field(:quantity_in_transit, :integer)

    field(:height, :float)
    field(:width, :float)
    field(:length, :float)
    field(:weight, :float)

    belongs_to(:location, Location)
    belongs_to(:sku, Sku)

    has_many(:components, Component)
  end
end
