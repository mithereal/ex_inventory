defmodule ExInventory.Schemas.Component do
  use ExInventory.Schema

  alias ExInventory.Schemas.Part

  @type t :: %__MODULE__{
          parts: [Part.t()]
        }

  schema "inventory_components" do
    has_many :parts, Part
  end
end
