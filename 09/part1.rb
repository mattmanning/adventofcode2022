class Head
  def initialize(tail)
    @x, @y, @tail = 0, 0, tail
  end

  def move(dir)
    case dir
    when 'U'
      @y += 1
    when 'D'
      @y -= 1
    when 'L'
      @x -= 1
    when 'R'
      @x += 1
    end
    @tail.head_position(@x,@y)
  end
end

class Tail
  attr_reader :visited

  def initialize
    @x, @y = 0, 0
    @visited = [[0,0]]
  end

  # Tail was 2, 4
  # Head moves to 4, 3
  def head_position(x, y)
    dx = x - @x #2
    dy = y - @y #1

    if dx.abs > 1
      @y = y if dy.abs > 0
      if dx < 0
        @x -= 1
      else
        @x += 1
      end
      @visited.push([@x, @y])
    end

    if dy.abs > 1
      @x = x if dx.abs > 0
      if dy < 0
        @y -= 1
      else
        @y += 1
      end
      @visited.push([@x, @y])
    end
  end  
end

tail = Tail.new
head = Head.new(tail)

File.readlines('input').each do |line|
  d, t = *line.split(' ')
  t.to_i.times { head.move(d) }
end

puts tail.visited.uniq.count
