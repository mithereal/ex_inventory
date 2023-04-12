defmodule ExInventory.Schemas.Component do
  use ExInventory.Schema

  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Sku
  alias ExInventory.Schemas.Properties

  @type t :: %__MODULE__{
          title: string(),
          parts: [Part.t()],
          sku: Sku.t()
        }

  schema "inventory_components" do
    field(:title, :string)
    has_many(:parts, Part)
    belongs_to(:sku, Sku)
    belongs_to(:properties, Properties)
    belongs_to(:properties, Properties)
  end
end
