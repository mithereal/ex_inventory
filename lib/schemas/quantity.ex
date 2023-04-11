defmodule ExInventory.Schemas.Quantity do
  use ExInventory.Schema

  @moduledoc """
  The basic unit of inventory. every item can be in a registry by status on_hand etc
  """

  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Item

  @type t :: %__MODULE__{
          on_hand: integer(),
          on_backorder: integer(),
          in_transit: integer(),
          type: string(),
          part: Part.t(),
          item: Item.t()
        }

  schema "inventory_quantitys" do
    field(:on_hand, :integer)
    field(:on_backorder, :integer)
    field(:in_transit, :integer)
    field(:type, :string)

    belongs_to(:part, Part)
    belongs_to(:item, Item)
  end
end
