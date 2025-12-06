defmodule Day06Test do
  use ExUnit.Case
  doctest Day06
  import AocHelper

  test "part 1 example" do
    assert Day06.part1("input/06_ex.txt") == 4277556
  end

  test "part 1 answer" do
    answer = solve_and_print "Day 06: Part 1", Day06.part1("input/06.txt")
    assert answer == 6503327062445
  end

  test "part 2 example" do
    assert Day06.part2("input/06_ex.txt") == 3263827
  end

  test "part 2 answer" do
    answer = solve_and_print "Day 06: Part 2", Day06.part2("input/06.txt")
    assert answer == 9640641878593
  end
end
