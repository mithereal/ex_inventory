defmodule ExInventory.Schemas.Sku do
  use ExInventory.Schema

  alias ExInventory.Schemas.Item

  @type t :: %__MODULE__{
          sku: string(),
          item: Item.t()
        }

  schema "inventory_skus" do
    field(:sku, :string)

    has_one(:item, Item)

    timestamps()
  end
end
