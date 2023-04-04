defmodule ExInventory.AutoSlug do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      @repo ExInventory.Config.repo()

      def get_by_slug(slug, struct \\ __MODULE__) do
        @repo.get_by(struct, slug: slug)
      end

      def get_by_slug!(slug, struct \\ __MODULE__) do
        @repo.get_by!(struct, slug: slug)
      end
    end
  end

  @repo ExInventory.Config.repo()

  def get_by_slug(slug, struct \\ __MODULE__) do
    @repo.get_by(struct, slug: slug)
  end

  def get_by_slug!(slug, struct \\ __MODULE__) do
    @repo.get_by!(struct, slug: slug)
  end
end
