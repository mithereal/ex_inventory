defmodule ExInventory.Schemas.Part do
  use ExInventory.Schema

  import Ecto.Changeset

  alias ExInventory.Schemas.{Location, Sku}

  @type t :: %__MODULE__{
          location: Location.t(),
          serial_number: String.t(),
          sku: Sku.t()
        }

  schema "inventory_parts" do
    field(:serial_number, :string)
    field(:assembly_build_id, :integer)
    field(:rma_description, :string)

    belongs_to(:location, Location)
    belongs_to(:sku, Sku)

    timestamps()
  end

  def changeset(part, attrs) do
    part
    |> cast(attrs, [:location_id, :serial_number, :assembly_build_id, :sku_id, :uuid])
    |> assoc_constraint(:sku)
    |> assoc_constraint(:location)
  end
end
