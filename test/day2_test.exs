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

  test "validate test data", state do
    assert length(state[:test_data]) == 2500
  end

  test "plays a single hand" do
    assert Day2.score_rock_paper_scissor("A", "X") == 4
  end

  test "scoring games yields the correct score" do
    games_to_score = [
      ["A", "Y", 8],
      ["B", "X", 1],
      ["C", "Z", 6],
      ["A", "X", 4],
      ["C", "X", 7]
    ]

    for [them, us, score] <- games_to_score do
      assert Day2.score_rock_paper_scissor(them, us) == score
    end
  end

  test "plays and scores rock paper scissor" do
    inputs = [["A", "Y"], ["B", "X"], ["C", "Z"]]
    assert Day2.score_rock_paper_scissor(inputs) == 15
  end

  test "plays using input file data", state do
    assert Day2.score_rock_paper_scissor(state[:test_data]) == 12458
  end

  test "plays using input but expected outcome" do
    assert Day2.play_rock_paper_scissor_with_expected_outcome("A", "Y") == 4
  end

  test "plays using input file data for fixed with", state do
    assert Day2.play_rock_paper_scissor_with_expected_outcome(state[:test_data]) == 12683
  end
end
