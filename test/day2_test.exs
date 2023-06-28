defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  setup_all do
    test_data =
      File.stream!(Path.join(:code.priv_dir(:aoc2022elixir), "day_2.txt"))
      |> Stream.map(&String.trim_trailing/1)
      |> Stream.map(&String.split(&1, " ", trim: true))
      |> Enum.to_list()

    {:ok, test_data: test_data}
  end

  test "plays and scores rock paper scissor" do
    inputs = [["A", "Y"], ["B", "X"], ["C", "Z"]]
    assert Day2.play_rock_paper_scissor(inputs) == 15
  end

  test "plays using input file data", state do
    assert Day2.play_rock_paper_scissor(state[:test_data]) == 12458
  end
end
