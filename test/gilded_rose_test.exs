defmodule GildedRoseTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  import Item

  doctest GildedRose

  defp assert_as_expected(actual, expected) do
    assert actual == expected
  end

  test_with_params "Value decreases with time",
                   fn (name, initial_sell_in, initial_quality, final_sell_in, final_quality) ->
                     [%Item{name: name, sell_in: initial_sell_in, quality: initial_quality}]
                     |> GildedRose.update_quality
                     |> assert_as_expected([%Item{name: name, sell_in: final_sell_in, quality: final_quality}])
                   end do
    [
      "Random item's quality degrades": {"random_item", 5, 10, 4, 9},
      "Conjured item's quality degrades twice as fast as normal items": {"Conjured", 5, 10, 4, 8},
      "Expired item's quality degrades twice as fast": {"expired_item", 0, 10, -1, 8},
      "Random item's quality cannot be below 0": {"random_item", 5, 0, 4, 0},
      "Aged Brie increases in quality": {"Aged Brie", 5, 10, 4, 11},
      "Aged Brie increases in quality twice as fast if expired": {"Aged Brie", 0, 10, -1, 12},
      "Quality never above 50": {"Aged Brie", 0, 50, -1, 50},
      "Sulfuras never degrades or has to be sold": {"Sulfuras, Hand of Ragnaros", 0, 80, 0, 80},
    ]
  end
end
