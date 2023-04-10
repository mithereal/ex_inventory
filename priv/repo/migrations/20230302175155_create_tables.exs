defmodule ExInventory.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    key_type = ExInventory.Config.key_type(:migration)

    create table(:inventory_skus, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:sku, :string)

      timestamps()
    end


    create table(:inventory_warehouses, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
      add(:location, :string)

      timestamps()
    end

    create table(:inventory_items, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
      add(:sub_title, :string)
      add(:description, :string)

      add(:quantity_on_hand, :integer, default: 0)
      add(:quantity_on_backorder, :integer, default: 0)
      add(:quantity_in_transit, :integer, default: 0)

      add(:height, :float)
      add(:width, :float)
      add(:length, :float)
      add(:weight, :float)

      add(
        :sku_id,
        references(:inventory_skus, on_delete: :nothing, type: key_type)
      )
      add(
        :location_id,
        references(:inventory_locations, on_delete: :nothing, type: key_type)
      )

      timestamps()
    end
  end
end
