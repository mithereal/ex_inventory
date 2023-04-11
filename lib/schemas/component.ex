defmodule ExInventory.Schemas.Component do
  use ExInventory.Schema

  alias ExInventory.Schemas.Part
  alias ExInventory.Schemas.Sku

  @type t :: %__MODULE__{
          parts: [Part.t()],
          sku: [Sku.t()]
        }

  schema "inventory_components" do
    has_many(:parts, Part)
    belongs_to(:sku, Sku)
  end
end
