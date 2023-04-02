defmodule ExInventory.AutoSlug do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      @repo ExInventory.Config.repo()

      def get_by_slug(slug) do
        @repo.get_by(__MODULE__, slug: slug)
      end

      def get_by_slug!(slug) do
        @repo.get_by!(__MODULE__, slug: slug)
      end
    end
  end

  @repo ExInventory.Config.repo()

  def get_by_slug(slug, struct \\ %{}) do
    @repo.get_by(struct, slug: slug)
  end

  def get_by_slug!(slug, struct \\ %{}) do
    @repo.get_by!(struct, slug: slug)
  end
end
