defmodule ExInventory.Repo.Migrations.CurrenciesTable do
  use Ecto.Migration
  def change do
  key_type = ExInventory.Config.key_type(:migration)

  create table(:inventory_currencies, primary_key: false) do
    add(:id, key_type, primary_key: true)
    add(:name, :string, null: false)
    add(:digits, :integer, default: 0)
    add(:symbol, :string, null: false)
    add(:alt_code, :string, null: false)
    add(:cash_digits, :integer, default: 0)
    add(:cash_rounding, :string, null: true)
    add(:code, :string, null: false)
    add(:from, :string, null: true)
    add(:to, :string, null: true)
    add(:iso_digits, :integer, default: 0)
    add(:narrow_symbol, :string, null: true)
    add(:rounding, :integer, default: 0)
    add(:tender, :boolean, default: false)
  end

  create(index(:inventory_currencies, [:symbol]))
end
end
