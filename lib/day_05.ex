defmodule Day05 do

  def part1(path) do
    input_parts = File.read!(path)
    |> String.split("\n\n", trim: true)

    fresh_ranges = parse_ranges(List.first(input_parts))
    ingredient_numbers = parse_ingredients(List.last(input_parts))

    ingredient_numbers
    |> Enum.filter(fn ingredient_number ->
      fresh_ranges
      |> Enum.any?(fn [low, high] ->
        ingredient_number <= high && ingredient_number >= low
      end)
    end)
    |> Enum.count()
  end

  def part2(path) do
    input_parts = File.read!(path)
    |> String.split("\n\n", trim: true)

    fresh_ranges = parse_ranges(List.first(input_parts))
    |> Enum.map(fn [low, high] -> Range.new(low, high) end)
    |> Enum.sort_by(& &1.first)

    merged_ranges =
      Enum.reduce(fresh_ranges, [], fn current_range, acc ->
        case acc do
          [] ->
            [current_range]

          [last_range | rest] ->
            if not Range.disjoint?(last_range, current_range) do
              new_end = max(last_range.last, current_range.last)
              new_range = Range.new(last_range.first, new_end)
              [new_range | rest]
            else
              [current_range, last_range | rest]
            end
        end
      end)

    merged_ranges
    |> Enum.map(fn range -> Range.size(range) end)
    |> Enum.sum()
  end

  defp parse_ranges(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map( fn range_str ->
      range_str
      |> String.split("-", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp parse_ingredients(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
