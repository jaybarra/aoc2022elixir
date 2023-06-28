defmodule Day2 do
  @moduledoc """

  A => rock
  B => paper
  C => scissor

  X => rock
  Y => paper
  Z => scissor
  """

  @rock 1
  @paper 2
  @scissor 3

  def play_rock_paper_scissor(gameplan) do
    gameplan
    |> Enum.map(fn [them, us] ->
      usxt =
        case us do
          "X" -> @rock
          "Y" -> @paper
          "Z" -> @scissor
        end

      themxt =
        case them do
          "A" -> @rock
          "B" -> @paper
          "C" -> @scissor
        end

      [themxt, usxt]
    end)
    |> Enum.reduce(0, fn [them, us], acc ->
      win_score =
        cond do
          us == them -> 3
          us == @rock && them == @scissor -> 6
          us == @paper && them == @rock -> 6
          us == @scissor && them == @paper -> 6
          true -> 0
        end

      us + win_score + acc
    end)
  end
end
