defmodule ExInventory.Schemas.Location do
  use ExInventory.Schema

  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Item

  @type t :: %__MODULE__{
          name: String.t(),
          area: atom(),
          disabled: boolean(),
          status: string(),
          parts: [Part.t()],
          items: [Item.t()]
        }

  schema "inventory_locations" do
    field(:name, :string)

    field(:area, Ecto.Enum,
      values: [:assembly, :receiving, :shipped, :shipping, :storage, :transit],
      default: :receiving
    )

    field(:disabled, :boolean, default: false)
    field(:status, :string, default: false)

    has_many(:parts, Part)
    has_many(:items, Item)

    timestamps()
  end
end
