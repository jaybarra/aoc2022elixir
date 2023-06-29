defmodule Day4 do
  @moduledoc """
  Camp Cleanup
  """

  def covers?(tgt, dest) do
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

    [i, j] =
      case Enum.count(a..b) > Enum.count(c..d) do
        true -> [a..b, c..d]
        false -> [c..d, a..b]
      end

    j
    |> Enum.filter(fn x -> Range.disjoint?(x..x, i) end)
    |> Enum.empty?()
  end

  def any_overlap?(tgt, dest) do
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

    not Range.disjoint?(a..b, c..d)
  end
end
