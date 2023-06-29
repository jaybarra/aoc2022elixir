defmodule Day3 do
  @moduledoc """
  Rucksack Reorganization
  """

  def compartment_contents(sack_contents) do
    String.split_at(sack_contents, div(String.length(sack_contents), 2))
  end

  def common_contents(sack_contents) do
    {c1, c2} = compartment_contents(sack_contents)

    c1
    |> String.split("", trim: true)
    |> Enum.find(fn v -> String.contains?(c2, [v]) end)
  end

  def component_value(item) do
    cond do
      String.match?(item, ~r/[a-z]/) -> Enum.at(to_charlist(item), 0) - 96
      String.match?(item, ~r/[A-Z]/) -> Enum.at(to_charlist(item), 0) - 38
    end
  end

  def common_sack_contents(sacks) do
    [c1, c2, c3] = sacks

    c1
    |> String.split("", trim: true)
    |> Enum.find(fn v ->
      String.contains?(c3, [v]) and
        String.contains?(c2, [v])
    end)
  end
end
