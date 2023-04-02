defmodule ExInventory.Schemas.Item do
  @moduledoc """
  The basic unit of inventory. every item can be in a registry by status on_hand etc
  """

  alias ExInventory.Schemas.Sku

  schema "inventory_items" do
    field(:title, :string)
    field(:sub_title, :string)
    field(:description, :string)

    belongs_to(:sku, Sku)
  end
end
