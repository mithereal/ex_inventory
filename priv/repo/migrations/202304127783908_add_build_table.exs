defmodule ExInventory.Repo.Migrations.BuildsTable do
  use Ecto.Migration

  def change do
    key_type = ExInventory.Config.key_type(:migration)

    create table(:inventory_builds, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:title, :string, null: false)
      add(:type, Ecto.Enum, values: [:component, :item])
      add(:properties, :map, default: %{})

      add(
        :component_id,
        references(:inventory_components, on_delete: :nothing, type: key_type)
      )

      add(
        :item_id,
        references(:inventory_items, on_delete: :nothing, type: key_type)
      )
    end

    create(index(:inventory_builds, [:symbol]))
  end
end
