total = File.readlines('input').inject(0) do|t, line|
  r = line.split(',').map {|range| Range.new(*range.split('-').map(&:to_i))}
  (r[0].cover?(r[1]) || r[1].cover?(r[0])) ? t+1 : t
end
puts total