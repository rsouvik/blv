defmodule Binder do
  @moduledoc """
  Dispatch for individual behaviours and this is where binding is happening based on name
  """
  @spec update_item(%Item{}) :: %Item{}
  def update_item(%Item{name: "Sulfuras, Hand of Ragnaros"} = item), do:  Sulfuras.update(item)
  def update_item(%Item{name: "Conjured"} = item), do: Conjured.update(item)
  def update_item(%Item{name: "Aged Brie"} = item), do: Aged_Brie.update(item)
  def update_item(item), do: Common.update(item)

end
