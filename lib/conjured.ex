defmodule Conjured do
  @moduledoc """
  implements Conjured Behaviour
  """

  @behaviour Base_Common
  def update(item), do: update_item(item, 2)

end
