defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  setup_all do
    simple_test_data = [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw"
    ]

    test_data =
      File.stream!(Path.join(:code.priv_dir(:aoc2022elixir), "day_3.txt"))
      |> Stream.map(&String.trim_trailing/1)
      |> Stream.map(&String.split(&1, " ", trim: true))
      |> Enum.to_list()

    {:ok, test_data: test_data, simple_test_data: simple_test_data}
  end

  test "compartment content detection", state do
    {compartment_1, compartment_2} =
      Day3.compartment_contents(Enum.at(state[:simple_test_data], 0))

    assert compartment_1 == "vJrwpWtwJgWr"
    assert compartment_2 == "hcsFMMfFFhFp"
  end

  test "compartment content detection 2", state do
    {compartment_1, compartment_2} =
      Day3.compartment_contents(Enum.at(state[:simple_test_data], 1))

    assert compartment_1 == "jqHRNqRjqzjGDLGL"
    assert compartment_2 == "rsFMfFZSrLrFZsSL"
  end

  test "common contents detection", state do
    assert Day3.common_contents(Enum.at(state[:simple_test_data], 0)) == "p"
    assert Day3.common_contents(Enum.at(state[:simple_test_data], 1)) == "L"
    assert Day3.common_contents(Enum.at(state[:simple_test_data], 2)) == "P"
    assert Day3.common_contents(Enum.at(state[:simple_test_data], 3)) == "v"
    assert Day3.common_contents(Enum.at(state[:simple_test_data], 4)) == "t"
    assert Day3.common_contents(Enum.at(state[:simple_test_data], 5)) == "s"
  end

  test "priority value determination" do
    assert Day3.component_value("p") == 16
    assert Day3.component_value("L") == 38
    assert Day3.component_value("P") == 42
    assert Day3.component_value("v") == 22
  end

  test "priority value determination of test data", state do
    total =
      state[:test_data]
      |> Enum.map(&Enum.at(&1, 0))
      |> Enum.map(&Day3.common_contents/1)
      |> Enum.map(&Day3.component_value/1)
      |> Enum.sum()

    assert total == 7568
  end

  test "finding common component between sacks" do
    cases = [
      {["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg"],
       "r"},
      {["wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]},
      "Z"
    ]

    for {data, outcome} <- cases do
      assert Day3.common_sack_contents(data) == outcome
    end
  end

  test "finding priorty of common components", state do
    priority_sum =
      state[:test_data]
      |> Enum.map(&Enum.at(&1, 0))
      |> Enum.chunk_every(3)
      |> Enum.map(&Day3.common_sack_contents/1)
      |> Enum.map(&Day3.component_value/1)
      |> Enum.sum()

    assert priority_sum == 2780
  end
end
