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
          customer_price: Money.Ecto.Composite.Type,
          whosale_price: Money.Ecto.Composite.Type,
          purchase_price: Money.Ecto.Composite.Type
        }

  schema "inventory_properties" do
    field(:height, :float)
    field(:width, :float)
    field(:length, :float)
    field(:weight, :float)

    field(:customer_price, Money.Ecto.Composite.Type)
    field(:whosale_price, Money.Ecto.Composite.Type)
    field(:purchase_price, Money.Ecto.Composite.Type)

    belongs_to(:part, Part)
    belongs_to(:item, Item)
    belongs_to(:component, Component)
  end
end
