defmodule ExInventory.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    key_type = ExInventory.Config.key_type(:migration)

    create table(:inventory_locations, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:name, :string)

      timestamps()
    end

    create table(:inventory_skus, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:sku, :string)

      timestamps()
    end

    create table(:inventory_item_locations, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
    end

    create table(:inventory_warehouse_locations, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
    end

    create table(:inventory_warehouses, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)

      add(
        :location_id,
        references(:inventory_warehouse_locations, on_delete: :nothing, type: key_type)
      )

      timestamps()
    end

    create table(:inventory_items, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string)
      add(:sub_title, :string)
      add(:description, :string)

      add(
        :location_id,
        references(:inventory_item_locations, on_delete: :nothing, type: key_type)
      )

      add(
        :sku_id,
        references(:inventory_skus, on_delete: :nothing, type: key_type)
      )

      timestamps()
    end
  end
end
