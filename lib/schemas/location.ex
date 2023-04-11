defmodule ExInventory.Schemas.Location do
  use ExInventory.Schema

  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Item

  @type t :: %__MODULE__{
          title: string(),
          area: atom(),
          parts: [Part.t()],
          items: [Item.t()]
        }

  schema "inventory_locations" do
    field(:title, :string)

    field(:area, Ecto.Enum,
      values: [:assembly, :receiving, :shipping, :storage],
      default: :receiving
    )

    has_many(:parts, Part)
    has_many(:items, Item)
  end
end
