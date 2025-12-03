defmodule Day03Test do
  use ExUnit.Case
  doctest Day03
  import AocHelper

  test "part 1 example" do
    assert Day03.part1("input/03_ex.txt") == 357
  end

  test "part 1 answer" do
    answer = solve_and_print "Day 03: Part 1", Day03.part1("input/03.txt")
    assert answer == 17405
  end

  test "part 2 example" do
    assert Day03.part2("input/03_ex.txt") == 3121910778619
  end

  test "part 2 answer" do
    answer = solve_and_print "Day 03: Part 2", Day03.part2("input/03.txt")
    assert answer == 171990312704598
  end
end
