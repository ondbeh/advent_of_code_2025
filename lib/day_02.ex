defmodule Day01 do
  def part1(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.map(fn dir ->
      dir
      |> String.replace("L", "-")
      |> String.replace("R", "")
      |> String.to_integer()
    end)
    |> Enum.reduce({50, 0}, fn dir, {old, count} ->
      curr = Integer.mod(old + dir, 100)

      if curr == 0 do
        {curr, count + 1}
      else
        {curr, count}
      end
    end)
    |> elem(1)
  end

  def part2(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.map(fn dir ->
      dir
      |> String.replace("L", "-")
      |> String.replace("R", "")
      |> String.to_integer()
    end)
    |> Enum.reduce({50, 0}, fn dir, {current_pos, total_zeros} ->
      target = current_pos + dir
      path_range =
        if dir > 0 do
          Range.new(current_pos + 1, target, 1)
        else
          Range.new(current_pos - 1, target, -1)
        end
      new_zeros =
        path_range
        |> Enum.count(fn step -> Integer.mod(step, 100) == 0 end)

      new_pos = Integer.mod(target, 100)

      {new_pos, total_zeros + new_zeros}
    end)
    |> elem(1)
  end


end
