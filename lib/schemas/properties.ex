defmodule ExInventory.Schemas.Properties do
  use ExInventory.Schema

  @moduledoc """
  The basic unit of inventory. every item can be in a registry by status on_hand etc
  """

  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Item
  alias ExInventory.Schemas.Component

  @type t :: %__MODULE__{
          height: float(),
          width: float(),
          length: float(),
          weight: float(),
          type: string()
        }

  schema "inventory_properties" do
    field(:height, :float)
    field(:width, :float)
    field(:length, :float)
    field(:weight, :float)
    field(:type, :string)

    belongs_to(:part, Part)
    belongs_to(:item, Item)
    belongs_to(:component, Component)
  end
end
