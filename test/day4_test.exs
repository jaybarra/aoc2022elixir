defmodule Day4Test do
  use ExUnit.Case
  doctest Day4

  setup_all do
    test_data =
      File.stream!(Path.join(:code.priv_dir(:aoc2022elixir), "day_4.txt"))
      |> Stream.map(&String.trim_trailing/1)
      |> Stream.map(&String.split(&1, " ", trim: true))
      |> Enum.to_list()

    {:ok, test_data: test_data}
  end

  test "assignments don't cover" do
    assert Day4.covers?("2-4", "6-8") == false
  end

  test "assignments cover" do
    assert Day4.covers?("6-6", "4-6") == true
  end

  test "checks how many cover" do
    sample_data = [
      "2-4,6-8",
      "2-3,4-5",
      "5-7,7-9",
      "2-8,3-7",
      "6-6,4-6",
      "2-6,4-8"
    ]

    assert sample_data
           |> Enum.map(&String.split(&1, ","))
           |> Enum.filter(fn [a, b] -> Day4.covers?(a, b) end)
           |> Enum.count() == 2
  end

  test "covers using real data", state do
    assert state[:test_data]
           |> Enum.map(&Enum.at(&1, 0))
           |> Enum.map(&String.split(&1, ","))
           |> Enum.filter(fn [a, b] -> Day4.covers?(a, b) end)
           |> Enum.count() == 595
  end

  test "any overlap (no)" do
    assert Day4.any_overlap?("2-4", "6-8") == false
  end

  test "any overlap (yes)" do
    assert Day4.any_overlap?("2-7", "6-8") == true
  end

  test "overlaps using real data", state do
    assert state[:test_data]
           |> Enum.map(&Enum.at(&1, 0))
           |> Enum.map(&String.split(&1, ","))
           |> Enum.filter(fn [a, b] -> Day4.any_overlap?(a, b) end)
           |> Enum.count() == 952
  end
end
