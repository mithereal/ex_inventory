defmodule ExInventory.Repo.Migrations.BuildsPropertiesTable do
  use Ecto.Migration

  def up do
    execute("CREATE INDEX builds_properties ON builds USING GIN(properties)")
  end

  def down do
    execute("DROP INDEX builds_properties")
  end
end
