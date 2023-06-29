defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  setup_all do
    test_data = Day1.load_from_file(Path.join(:code.priv_dir(:aoc2022elixir), "day_1.txt"))
    {:ok, test_data: test_data}
  end

  test "calculates the correct calories" do
    assert Day1.max_calories([
             1000,
             2000,
             3000,
             nil,
             4000,
             nil,
             5000,
             6000,
             nil,
             7000,
             8000,
             9000,
             nil,
             10000
           ]) == 24000
  end

  test "loads from file as list", state do
    assert length(state[:test_data]) == 2263
  end

  test "loads from file as list of integers and nils", state do
    assert Enum.at(state[:test_data], 0) == 9686
    assert Enum.at(state[:test_data], 8) == nil
  end

  test "evaluate answer", state do
    assert Day1.max_calories(state[:test_data]) == 69206
  end
end
