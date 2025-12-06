defmodule Day06 do

  def part1(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
      row
      |> String.split(" ", trim: true)
    end)
    |> Enum.reverse()
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn [op|num_string_list] ->
      num_list = Enum.map(num_string_list, &String.to_integer/1)
      case op do
        "+" -> Enum.sum(num_list)
        "*" -> Enum.reduce(num_list, 1, &*/2)
      end
    end)
    |> Enum.sum()
  end

  def part2(path) do
    lines = File.read!(path)
    |> String.split("\n", trim: true)

    max_length = lines
    |> Enum.map(&String.length/1)
    |> Enum.max()

    padded_lines = Enum.map(lines, &String.pad_trailing(&1, max_length, " "))

    padded_lines
    |> Enum.map(&String.graphemes/1)
    |> Enum.reverse()
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn [first | rest] ->
      rest_string = rest
      |> Enum.reject(fn char -> char == " " end)
      |> Enum.reduce("", fn char, acc -> char <> acc end)

      if first == " " do
        rest_string
      else
        first <> " " <> rest_string
      end
    end)
    |> Enum.reduce("", fn num, acc -> acc <> " " <> num end)
    |> String.split("  ", trim: true)
    |> Enum.map(fn line ->
      [op | nums_strings] = line
      |> String.split(" ", trim: true)

      num_list = nums_strings
      |> Enum.map(&String.to_integer/1)

      case op do
        "+" -> Enum.sum(num_list)
        "*" -> Enum.reduce(num_list, 1, &*/2)
      end
    end)
    |> Enum.sum()
    |> dbg()
  end

end
