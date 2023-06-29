defmodule Day5 do
  def reposition(crates, quantity, src, dest) do
    case Enum.at(crates, dest - 1) do
      nil ->
        crates |> List.delete_at(src - 1) |> List.insert_at(dest - 1, Enum.at(crates, src - 1))

      _ ->
        crates
    end
  end
end
