defmodule ExInventory.Schemas.Build do
  use ExInventory.Schema

  @moduledoc """
  The build that includes the req inventory fo fulfill creation of the component/item.
  """

  alias ExInventory.Schemas.Component
  alias ExInventory.Schemas.Part

  @type t :: %__MODULE__{
          title: string(),
          properties: map()
        }

  schema "inventory_builds" do
    field(:title, :string, null: false)
    field(:type, Ecto.Enum, values: [:component, :item])
    field(:properties, :map, default: %{})

    belongs_to(:component, Component)
    belongs_to(:part, Part)
  end

end
