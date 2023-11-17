# frozen_string_literal: true

first_content = File.readlines('aoc-1.txt').map(&:to_i)

split_content = first_content.chunk_while { |i, j| i != 0 && j != 0 }
split_content.reject { |x| x == [0] }

sum_of_split = split_content.map(&:sum)

p sum_of_split.max, sum_of_split.sort.last(3).sum
