defmodule Day04 do

  def part1(path) do
    input = File.read!(path)
    symbol_map = parse_symbol_map(input)

    Enum.filter(symbol_map, fn {{row, col}, _symbol} ->
      has_neibhbouring_symbols?({row, col}, symbol_map)
    end)
    |> Enum.count()
  end

  def part2(path) do
    input = File.read!(path)
    symbol_map = parse_symbol_map(input)

    remove_recursively(symbol_map, 0)
  end

  defp remove_recursively(symbol_map, total_removed) do
    keys_to_remove =
      symbol_map
      |> Enum.filter(fn {coords, _symbol} ->
        has_neibhbouring_symbols?(coords, symbol_map)
      end)
      |> Enum.map(fn {coords, _val} -> coords end)

    if Enum.empty?(keys_to_remove) do
      total_removed
    else
      new_map = Map.drop(symbol_map, keys_to_remove)
      count_removed = length(keys_to_remove)

      remove_recursively(new_map, total_removed + count_removed)
    end
  end

  defp parse_symbol_map(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.reduce(%{}, &get_symbols_from_row/2)
  end

  @symbol_regex ~r/([@])/
  defp get_symbols_from_row({line, row_num}, acc_map) do
      matches = Regex.scan(@symbol_regex, line, return: :index, capture: :all_but_first)
        |> Enum.zip(Regex.scan(@symbol_regex, line, capture: :all_but_first))
        |> Enum.map(fn {[{index, _}], [match]} ->
          {match, index}
        end)

      Enum.reduce(matches, acc_map, fn {match, col_num}, map ->
        Map.put(map, {row_num, col_num}, match)
      end)
  end

  @count_max 5
  defp has_neibhbouring_symbols?({row, col}, symbol_map) do
    row_range = (row - 1)..(row + 1)
    col_range = (col - 1)..(col + 1)

    places_to_check = for r <- row_range, c <- col_range do
      {r,c}
    end

    count_actual = Enum.count(places_to_check, fn coordinates ->
      Map.has_key?(symbol_map, coordinates)
    end)

    count_actual < @count_max
  end
end
