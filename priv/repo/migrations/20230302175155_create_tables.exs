defmodule ExInventory.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    key_type = ExInventory.Config.key_type(:migration)

    create table(:inventory_skus, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:sku, :string)
    end

    create table(:inventory_locations, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
      add(:area, :string)
      add(:status, :string)
    end

    create table(:inventory_quantitys, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:on_hand, :integer)
      add(:on_backorder, :integer)
      add(:in_transit, :integer)
      add(:type, :string)
    end

    create table(:inventory_parts, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:serial_number, :integer)
      add(:assembly_build_id, :integer)
      add(:rma_description, :integer)
    end


    create table(:inventory_warehouses, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
      add(:location, :string)
    end

    create table(:inventory_items, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
      add(:sub_title, :string)
      add(:description, :string)

      add(
        :sku_id,
        references(:inventory_skus, on_delete: :nothing, type: key_type)
      )
      add(
        :location_id,
        references(:inventory_locations, on_delete: :nothing, type: key_type)
      )

      add(
        :quantity_id,
        references(:inventory_quantitys, on_delete: :nothing, type: key_type)
      )

      add(
        :properties_id,
        references(:inventory_properties, on_delete: :nothing, type: key_type)
      )

      timestamps()
    end
  end
end
