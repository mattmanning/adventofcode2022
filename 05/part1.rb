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
  moves[0].times { stacks[moves[2]-1].unshift stacks[moves[1]-1].shift }
end

puts stacks.inject("") { |str, stack| str + stack.first }
