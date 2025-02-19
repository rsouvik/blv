defmodule Conjured do
  @moduledoc """
  implements Conjured Behaviour
  """
  import Helper, only: [update_item: 2]

  @behaviour Base_Common
  def update(item), do: update_item(item, 2)

end
