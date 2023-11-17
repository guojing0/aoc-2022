# frozen_string_literal: true

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

def judge(opponent, me)
  return :draw if me == opponent

  WINNING_CONDITIONS[me] == opponent ? :win : :lose
end

def letter_to_sym(letter)
  case letter
  when 'A', 'X' then :rock
  when 'B', 'Y' then :paper
  when 'C', 'Z' then :scissors
  end
end

total_score = File.readlines('aoc-2.txt').sum do |round|
  rd = round.split.map { |x| letter_to_sym(x) }
  result = judge(rd[0], rd[1])
  OUTCOME_SCORE[result] + SHAPE_SCORE[rd[1]]
end

p total_score
