defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  setup_all do
    test_data =
      File.stream!(Path.join(:code.priv_dir(:aoc2022elixir), "day_5.txt"))
      |> Stream.map(&String.trim_trailing/1)
      |> Stream.map(&String.split(&1, " ", trim: true))
      |> Enum.to_list()

    {:ok, test_data: test_data}
  end

  # test "crate stacking" do
  #   crates = [[nil, :D, nil], [:N, :C, nil], [:Z, :M, :P]]
  #   plan = [[1, 2, 1], [3, 1, 3], [2, 2, 1], [1, 1, 2]]

  #   Enum.reduce(crates, [], fn row, acc -> acc ++ row end)
  # end

  test "moves crates easy" do
    crates = [:a, nil, nil]
    assert Day5.reposition(crates, 1, 1, 3) == [nil, nil, :a]
  end

  @tag :skip
  test "moves crates new row" do
    crates = [:a, :b, nil]
    assert Day5.reposition(crates, 1, 2, 1) == [:b, nil, nil, :a, nil, nil]
  end
end
