defmodule Day1 do
  @moduledoc """
  Calorie Counting
  """

  def max_calories(calorie_list) do
    calorie_list
    |> Enum.chunk_by(&(&1 == nil))
    |> Enum.map(fn vals -> Enum.reduce(vals, fn x,acc -> x + acc end) end)
    |> Enum.filter(&(&1 != nil))
    |> Enum.max
  end

  def load_from_file(file_path) do
    File.stream!(file_path)
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.to_list
    |> Enum.map(fn x ->
      case x do
	"" -> nil
	s -> String.to_integer(s)
      end
    end)
  end
end
