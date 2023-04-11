defmodule ExInventory.Schemas.Sku do
  use ExInventory.Schema

  alias ExInventory.Schemas.Item
  alias ExInventory.Schemas.Part

  @type t :: %__MODULE__{
          sku: string(),
          item: Item.t(),
          part: Part.t()
        }

  schema "inventory_skus" do
    field(:sku, :string)

    has_one(:item, Item)
    has_one(:part, Part)
  end
end
