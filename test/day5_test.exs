defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  setup_all do
    test_data =
      File.stream!(Path.join(:code.priv_dir(:aoc2022elixir), "day_5p.txt"))
      |> Stream.map(&String.trim_trailing/1)
      |> Stream.map(&String.split(&1, " ", trim: true))
      |> Enum.to_list()

    {:ok, test_data: test_data}
  end
end
