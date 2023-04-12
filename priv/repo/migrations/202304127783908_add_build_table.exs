defmodule ExInventory.Repo.Migrations.BuildsTable do
  use Ecto.Migration

  def change do
    key_type = ExInventory.Config.key_type(:migration)

    create table(:inventory_builds, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string, null: false)
      add(:properties, :map, default: %{})
    end

    create(index(:inventory_builds, [:symbol]))
  end
end
