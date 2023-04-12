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

  locations =
    Application.get_env(:ex_inventory, :locations,  [
      :assembly,
      :receiving,
      :shipping,
      :storage
    ])

  default_location = Application.get_env(:ex_inventory, :default_location) || :receiving

  schema "inventory_locations" do
    field(:title, :string)

    field(:area, Ecto.Enum,
      values: locations,
      default: default_location
    )

    has_many(:parts, Part)
    has_many(:items, Item)
  end
end
