# frozen_string_literal: true

# Some dictionaries settings

SHAPE_SCORE = {
  rock: 1,
  paper: 2,
  scissors: 3
}.freeze

OUTCOME_SCORE = {
  win: 6,
  draw: 3,
  lose: 0
}.freeze

WINNING_CONDITIONS = {
  rock: :scissors,
  paper: :rock,
  scissors: :paper
}.freeze

LOSING_CONDITIONS = WINNING_CONDITIONS.invert

# Set up basic input

problem_input = File.readlines('aoc-2.txt')

# First problem

def judge(opponent, my_choice)
  return :draw if my_choice == opponent

  WINNING_CONDITIONS[my_choice] == opponent ? :win : :lose
end

def letter_to_sym(letter)
  case letter
  when 'A', 'X' then :rock
  when 'B', 'Y' then :paper
  when 'C', 'Z' then :scissors
  end
end

def solve_first_problem(input)
  input.sum do |round|
    rd = round.split.map { |x| letter_to_sym(x) }
    result = judge(rd[0], rd[1])
    OUTCOME_SCORE[result] + SHAPE_SCORE[rd[1]]
  end
end

p solve_first_problem(problem_input)

# Second Problem

LETTER_TO_SYM_MAP = {
  'A' => :rock,
  'B' => :paper,
  'C' => :scissors,
  'X' => :lose,
  'Y' => :draw,
  'Z' => :win
}.freeze

def make_choice(opponent, result)
  case result
  when :win then LOSING_CONDITIONS[opponent]
  when :lose then WINNING_CONDITIONS[opponent]
  else opponent
  end
end

def solve_second_problem(input)
  input.sum do |round|
    opponent, result = round.split.map { |x| LETTER_TO_SYM_MAP[x] }
    OUTCOME_SCORE[result] + SHAPE_SCORE[make_choice(opponent, result)]
  end
end

p solve_second_problem(problem_input)
