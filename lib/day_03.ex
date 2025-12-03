defmodule Day03 do
  # --- Part 1 ---
  def part1(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.map(&process_line_part1/1)
    |> Enum.sum()
  end

  defp process_line_part1(line) do
    search_area = Enum.slice(line, 0..-2//1)
    {index1, digit1} = Enum.max_by(search_area, fn {_idx, val} -> val end)

    remaining_line = Enum.drop(line, index1 + 1)
    {_index2, digit2} = Enum.max_by(remaining_line, fn {_idx, val} -> val end)

    10 * digit1 + digit2
  end

  def part2(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.map(&process_line_part2/1)
    |> Enum.sum()
  end

  defp process_line_part2(line) do
    digits = Enum.map(line, fn {_idx, val} -> val end)

    {_final_list, chosen_digits} =
      Enum.reduce(1..12, {digits, []}, fn i, {current_list, acc} ->
        needed_after_this = 12 - i

        limit = length(current_list) - needed_after_this - 1

        {val, relative_index} =
          current_list
          |> Enum.slice(0..limit)
          |> Enum.with_index()
          |> Enum.max_by(fn {val, _idx} -> val end)

        next_list = Enum.drop(current_list, relative_index + 1)

        {next_list, [val | acc]}
      end)

    chosen_digits
    |> Enum.reverse()
    |> Integer.undigits()
  end

  defp parse_line(line) do
    line
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map(fn {char, index} -> {index, String.to_integer(char)} end)
  end
end
