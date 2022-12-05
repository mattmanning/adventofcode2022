lines = File.readlines('input')
stacks = Array.new(9,[])

lines[0..7].each do |line|
  line.scan(/.{4}/m).each_with_index do |c,i|
    if m = /\[(\w)\]/.match(c)
      stacks[i] += [m[1]]
    end
  end
end


lines[10..-1].each do |line|
  moves = line.scan(/\d+/).map(&:to_i)
  qty, from, to = moves[0], moves[1]-1, moves[2]-1
  stacks[to].unshift stacks[from].shift(qty)
  stacks[to] = stacks[to].flatten
end

puts stacks.inject("") { |str, stack| str + (stack.first || "") }
