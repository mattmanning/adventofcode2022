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
    puts "Head: #{@x}, #{@y}"
    @tail.head_position(@x,@y)
  end
end

class Tail
  attr_reader :visited

  def initialize(tail=nil)
    @x, @y, @tail = 0, 0, tail
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
      puts "Tail: #{@x}, #{@y}"
      @visited.push([@x, @y])
    end

    if dy.abs > 1
      @x = x if dx.abs > 0
      if dy < 0
        @y -= 1
      else
        @y += 1
      end
      puts "Tail: #{@x}, #{@y}"
      @visited.push([@x, @y])
    end
    @tail.head_position(@x, @y) if @tail
  end  
end

tail9 = Tail.new
tail8 = Tail.new(tail9)
tail7 = Tail.new(tail8)
tail6 = Tail.new(tail7)
tail5 = Tail.new(tail6)
tail4 = Tail.new(tail5)
tail3 = Tail.new(tail4)
tail2 = Tail.new(tail3)
tail1 = Tail.new(tail2)
head = Head.new(tail1)

File.readlines('sample').each do |line|
  puts line
  d, t = *line.split(' ')
  t.to_i.times { head.move(d) }
end

puts tail9.visited.inspect
puts tail9.visited.uniq.count
