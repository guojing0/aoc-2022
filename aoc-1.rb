first_content = File.readlines('aoc-1.txt').map(&:to_i)

splited_content = first_content.chunk_while { |i, j| i != 0 && j != 0 }
splited_content.reject { |x| x == [0] }

sum_of_splitted = splited_content.map(&:sum)

p sum_of_splitted.max, sum_of_splitted.sort.last(3).sum
