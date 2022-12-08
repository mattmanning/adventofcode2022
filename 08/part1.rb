arr = File.readlines('input')

ymax = arr.length - 1
xmax = arr.first.chomp.split('').length - 1

grid = arr.each_with_index.inject({}) do |hsh, (line, y)|
  line.chomp.split('').each_with_index.map do |point, x|
    hsh[[x,y]] = { height: point.to_i }
    hsh[[x,y]][:visible] = true if (x == 0) || (x == xmax) || (y == 0) || (y == ymax)
  end
  hsh
end

def mark_visibility(tree, max)
  tree[:visible] = true if tree[:height] > max 
  max = tree[:height] if tree[:height] > max
  max
end

# Down
0.upto(xmax) do |x|
  max = 0
  0.upto(ymax) { |y| max = mark_visibility(grid[[x,y]], max) }
end

# Up
0.upto(xmax) do |x|
  max = 0
  ymax.downto(0) { |y| max = mark_visibility(grid[[x,y]], max) }
end

# Right
0.upto(ymax) do |y|
  max = 0
  0.upto(xmax) { |x| max = mark_visibility(grid[[x,y]], max) }
end

# Left
0.upto(ymax) do |y|
  max = 0
  xmax.downto(0) { |x| max = mark_visibility(grid[[x,y]], max) }
end

visible = grid.inject(0) do |total, t|
  t.last[:visible] ? total + 1 : total
end
puts visible