defmodule Day2 do
  @moduledoc """

  A/X => rock:     1
  B/Y => paper:    2
  C/Z => scissors: 3

  win = 6
  tie = 3
  loss = 0

  ## Examples

  iex> Day2.score_game(:rock, :paper)
  6

  iex> Day2.score_game(:paper, :rock)
  0
  """

  def letter_to_symbol(sym) do
    cond do
      String.match?(sym, ~r/[AX]/i) -> :rock
      String.match?(sym, ~r/[BY]/i) -> :paper
      String.match?(sym, ~r/[CZ]/i) -> :scissor
    end
  end

  def letter_to_outcome(sym) do
    case sym do
      "X" -> :lose
      "Y" -> :draw
      "Z" -> :win
    end
  end

  def score_game(them, us) do
    cond do
      us == them -> 3
      us == :rock && them == :scissor -> 6
      us == :paper && them == :rock -> 6
      us == :scissor && them == :paper -> 6
      true -> 0
    end
  end

  def score_symbol(sym) do
    case sym do
      :rock -> 1
      :paper -> 2
      :scissor -> 3
    end
  end

  def score_rock_paper_scissor(them, us) do
    [them, us] = Enum.map([them, us], &letter_to_symbol/1)
    score_symbol(us) + score_game(them, us)
  end

  def score_rock_paper_scissor(rounds) do
    rounds
    |> Enum.map(fn [a, b] -> score_rock_paper_scissor(a, b) end)
    |> Enum.sum()
  end

  def play_rock_paper_scissor_with_expected_outcome(them, outcome) do
    them_sym = letter_to_symbol(them)

    us =
      case [them_sym, letter_to_outcome(outcome)] do
        [:scissor, :win] -> "X"
        [:scissor, :lose] -> "Y"
        [:paper, :win] -> "Z"
        [:paper, :lose] -> "X"
        [:rock, :win] -> "Y"
        [:rock, :lose] -> "Z"
        _ -> them
      end

    score_rock_paper_scissor(them, us)
  end

  def play_rock_paper_scissor_with_expected_outcome(rounds) do
    rounds
    |> Enum.map(fn [a, b] -> play_rock_paper_scissor_with_expected_outcome(a, b) end)
    |> Enum.sum()
  end
end
