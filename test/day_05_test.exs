defmodule Day05Test do
  use ExUnit.Case
  doctest Day05
  import AocHelper

  test "part 1 example" do
    assert Day05.part1("input/05_ex.txt") == 3
  end

  test "part 1 answer" do
    answer = solve_and_print "Day 05: Part 1", Day05.part1("input/05.txt")
    assert answer == 789
  end

  test "part 2 example" do
    assert Day05.part2("input/05_ex.txt") == 14
  end

  test "part 2 answer" do
    answer = solve_and_print "Day 05: Part 2", Day05.part2("input/05.txt")
    assert answer == 343329651880509
  end
end
