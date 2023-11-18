problem_input = File.readlines('aoc-4.txt')

def either_contains(fst_arr, snd_arr)
  (fst_arr - snd_arr).empty? || (snd_arr - fst_arr).empty?
end

def range_to_array(input)
  input.split('-').map(&:to_i).then { |x, y| (x..y).to_a }
end

def first_problem(input)
  input.count do |pair|
    split_pair = pair.strip.split(',')
    fst, snd = split_pair.map { |section| range_to_array(section) }
    either_contains(fst, snd)
  end
end

p first_problem(problem_input)

def second_problem(input)
  input.count do |pair|
    split_pair = pair.strip.split(',')
    fst, snd = split_pair.map { |section| range_to_array(section) }
    (fst & snd).any?
  end
end

p second_problem(problem_input)
