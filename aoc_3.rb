hash_table = ('a'..'z').zip(1..26).to_h
uppercase_hash = ('A'..'Z').zip(27..52).to_h
hash_table.update(uppercase_hash)

problem_input = File.readlines('aoc-3.txt')

def first_problem(input, hash_table)
  input.sum do |bag|
    fst, snd = bag.chars.each_slice(bag.length / 2).map(&:join)
    common_char = (fst.chars & snd.chars).first
    hash_table[common_char]
  end
end

p first_problem(problem_input, hash_table)

def second_problem(input, hash_table)
  input.each_slice(3).sum do |group_bag|
    intersection = group_bag.map(&:chars).reduce(:&).first
    hash_table[intersection]
  end
end

p second_problem(problem_input, hash_table)
