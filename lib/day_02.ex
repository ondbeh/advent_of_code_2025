defmodule Day02 do
  def part1(path) do
    File.read!(path)
    |> String.split(",", trim: true)
    |> Enum.flat_map(fn range_str ->
      [lower, higher] =
        range_str
        |> String.split("-", trim: true)
        |> Enum.map(&String.to_integer/1)

      lower..higher
    end)
    |> Enum.filter(&is_mirrored?/1)
    |> Enum.sum()
  end

  def part2(path) do
    File.read!(path)
    |> String.split(",", trim: true)
    |> Enum.flat_map(fn range_str ->
      [lower, higher] =
        range_str
        |> String.split("-", trim: true)
        |> Enum.map(&String.to_integer/1)

      lower..higher
    end)
    |> Enum.filter(&is_periodic?/1)
    |> Enum.sum()
  end

  defp is_periodic?(number) do
    str = Integer.to_string(number)
    len = String.length(str)
    if len < 2 do
      false
    else
      1..div(len, 2)
      |> Enum.any?(fn chunk_size ->
        if rem(len, chunk_size) == 0 do
          chunk = String.slice(str, 0, chunk_size)
          count = div(len, chunk_size)
          new = String.duplicate(chunk, count)
          new == str
        else
          false
        end
      end)
    end
  end

  defp is_mirrored?(number) do
     s = Integer.to_string(number)
      len = String.length(s)

      rem(len, 2) == 0 &&
        (
          {head, tail} = String.split_at(s, div(len, 2))
          head == tail
        )
  end
end
