SHAPE = {
  'A' => 'R',
  'B' => 'P',
  'C' => 'S',
  'X' => 'R',
  'Y' => 'P',
  'Z' => 'S'
}

POINTS = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3
}

def win?(play, opp)
  return true if (play == 'R' && opp == 'S')
  return true if (play == 'P' && opp == 'R')
  return true if (play == 'S' && opp == 'P')
  false
end

def outcome(play, opp)
  return 6 if win?(play, opp)
  return 3 if play == opp
  0
end

sum = File.readlines('input').map do |line|
  col1, col2 = *line.split(' ')
  outcome(SHAPE[col2], SHAPE[col1]) + POINTS[col2]
end.sum

puts sum