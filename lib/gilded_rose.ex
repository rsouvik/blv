defmodule GildedRose do
  @spec update_quality(list(%Item{})) :: list(%Item{})
  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  @spec update_item(%Item{}) :: %Item{}
  def update_item(item) do
    item
    |> Binder.update_item
  end
end
