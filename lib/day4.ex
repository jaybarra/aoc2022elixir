defmodule Day4 do
  @moduledoc """
  Camp Cleanup
  """

  def schedule_to_ranges(tgt, dest) do
    ab = String.split(tgt, "-")
    cd = String.split(dest, "-")

    [a, b, c, d] =
      (ab ++ cd)
      |> Enum.map(fn x ->
        case Integer.parse(x) do
          {x, _decima} -> x
          _ -> nil
        end
      end)

    [a..b, c..d]
  end

  def covers?(tgt, dest) do
    [tgt, dest] = schedule_to_ranges(tgt, dest)

    [i, j] =
      case Enum.count(tgt) > Enum.count(dest) do
        true -> [tgt, dest]
        false -> [dest, tgt]
      end

    j
    |> Enum.filter(fn x -> Range.disjoint?(x..x, i) end)
    |> Enum.empty?()
  end

  def any_overlap?(tgt, dest) do
    [a, b] = schedule_to_ranges(tgt, dest)
    not Range.disjoint?(a, b)
  end
end
