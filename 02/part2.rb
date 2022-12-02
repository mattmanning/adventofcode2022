class Shape
  attr_accessor :beats, :loses_to, :shape, :play, :opp, :points

  def initialize(beats: nil, loses_to: nil, shape:, play:, opp:, points:)
    @beats, @loses_to, @shape, @play, @opp, @points = beats, loses_to, shape, play, opp, points
  end
end

rock     = Shape.new(shape: 'R', play: 'X', opp: 'A', points: 1)
paper    = Shape.new(shape: 'P', play: 'Y', opp: 'B', points: 2, beats: rock)
scissors = Shape.new(shape: 'S', play: 'Z', opp: 'C', points: 3, beats: paper, loses_to: rock)

rock.beats = scissors
rock.loses_to = paper
paper.loses_to = scissors

shapes = rock, paper, scissors

def by_opp(shapes, opp)
  shapes.detect { |s| s.opp == opp }
end

def win?(play_shape, opp_shape)
  play_shape.beats == opp_shape
end

def outcome(play_shape, opp_shape)
  return 6 if win?(play_shape, opp_shape)
  return 3 if play_shape == opp_shape
  0
end

sum = File.readlines('input').map do |line|
  col1, col2 = *line.split(' ')
  opp = by_opp(shapes, col1)
  play = case col2
  when 'X'
    opp.beats
  when 'Y'
    opp
  when 'Z'
    opp.loses_to
  end
  outcome(play, opp) + play.points
end.sum

puts sum
