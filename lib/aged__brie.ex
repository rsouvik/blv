defmodule Aged_Brie do
  @moduledoc ""
  implements Aged_Brie
  ""

  import Helper, only: [update_item: 2]

  @behaviour Base_Common
  def update(%Item{sell_in: sell_in} = item) when sell_in <= 0, do: update_item(item, -2)
  def update(item), do: update_item(item, -1)

end
