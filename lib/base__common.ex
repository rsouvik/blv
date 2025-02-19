defmodule Base_Common do
  @moduledoc """
    Base callback
  """
  @callback update(item :: %Item{}) :: %Item{}
end
