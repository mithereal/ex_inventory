defmodule ExInventory.Schemas.Item do
  use ExInventory.Schema

  @moduledoc """
  The basic unit of inventory. every item can be in a registry by status on_hand etc
  """

  alias ExInventory.Schemas.Sku
  alias ExInventory.Schemas.Component
  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Location
  alias ExInventory.Schemas.Item.Quantity

  @type t :: %__MODULE__{
          title: string(),
          sub_title: string(),
          description: string(),
          location: Location.t(),
          sku: Sku.t(),
          quantity: Quantity.t(),
          components: [Component.t()],
          parts: [Part.t()]
        }

  schema "inventory_items" do
    field(:title, :string)
    field(:sub_title, :string)
    field(:description, :string)

    belongs_to(:location, Location)
    belongs_to(:sku, Sku)
    belongs_to(:quantity, Quantity)

    has_many(:components, Component)
    has_many(:parts, Part)
  end
end
