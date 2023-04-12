defmodule ExInventory.Schemas.Build do
  use ExInventory.Schema

  @moduledoc """
  The build that includes the req inventory fo fulfill creation of the component/item.
  """

  @type t :: %__MODULE__{
          title: string(),
          properties: map()
        }

  schema "inventory_builds" do
    field(:title, :string, null: false)
    field(:properties, :map, default: %{})
  end
end
