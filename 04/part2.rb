require 'set'

total = File.readlines('input').inject(0) do|t, line|
  s = line.split(',').map {|range| Range.new(*range.split('-').map(&:to_i)).to_set}
  s[0].intersect?(s[1]) ? t+1 : t
end
puts total