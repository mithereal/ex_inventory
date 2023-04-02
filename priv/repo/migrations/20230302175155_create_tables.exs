defmodule ExInventory.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    key_type = ExInventory.Config.key_type(:migration)

    create table(:inventory_locations, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add :name, :string
      add :area, :string
      add :disabled, :boolean, default: false
      add :removed, :boolean, default: false

      timestamps()
    end

    create table(:inventory_skus, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add :sku, :string

      timestamps()
    end

    create table(:inventory_items, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add :title, :string
      add :sub_title, :string
      add :description, :string

      add :location_id, references(:inventory_locations), null: false, type: key_type
      add :sku_id, references(:inventory_skus), null: false, type: key_type

      timestamps()
    end
end
end
