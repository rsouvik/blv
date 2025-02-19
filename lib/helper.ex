defmodule Helper do
  @moduledoc """
  helper functions
  """
  @spec update_item(%Item{}, integer()) :: %Item{}
  def update_item(%Item{quality: quality, sell_in: sell_in} = item, quality_step) do
    %{item | sell_in: sell_in - 1, quality: quality - quality_step}
    |> quality_not_above_50
    |> quality_not_below_0
  end

  @spec quality_not_above_50(%Item{}) :: %Item{}
  defp quality_not_above_50(%Item{quality: quality} = item) when quality < 50, do: item
  defp quality_not_above_50(%Item{} = item), do: %{item | quality: 50}

  @spec quality_not_below_0(%Item{}) :: %Item{}
  defp quality_not_below_0(%Item{quality: quality} = item) when quality > 0, do: item
  defp quality_not_below_0(%Item{} = item), do: %{item | quality: 0}

end
