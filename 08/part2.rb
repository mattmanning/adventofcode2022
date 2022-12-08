arr = File.readlines('input')

ymax = arr.length - 1
xmax = arr.first.chomp.split('').length - 1

grid = arr.each_with_index.inject(Hash.new(0)) do |hsh, (line, y)|
  line.chomp.split('').each_with_index.map do |point, x|
    hsh[[x,y]] = { height: point.to_i }
  end
  hsh
end

def set_scenic_score(grid,x,y,xmax,ymax)
  tree = grid[[x,y]]

  # Up
  i = x
  j = y
  up = 0
  while true
    break if j == 0
    up += 1
    j -= 1
    break if grid[[i,j]][:height] >= tree[:height]
  end

  # Down
  i = x
  j = y
  down = 0
  while true
    break if j == ymax
    down += 1
    j += 1
    break if grid[[i,j]][:height] >= tree[:height]
  end

  # Left
  i = x
  j = y
  left = 0
  while true
    break if i == 0
    left += 1
    i -= 1
    break if grid[[i,j]][:height] >= tree[:height]
  end

  # Right
  i = x
  j = y
  right = 0
  while true
    break if i == xmax
    right += 1
    i += 1
    break if grid[[i,j]][:height] >= tree[:height]
  end

  tree[:scenic_score] = up * down * left * right
end

0.upto(xmax) do |x|
  0.upto(ymax) do |y|
    set_scenic_score(grid, x, y, xmax, ymax)
  end
end

puts grid.map { |e| e.last[:scenic_score] }.max

