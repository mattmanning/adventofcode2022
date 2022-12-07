sizes = Hash.new(0)
path = []
files = {}

# Find absolute path to each file size
File.readlines('input').each do |line|
  if /cd\s\.\./.match(line)
    path.pop
  elsif m = /cd\s(.+)/.match(line)
    path.push m[1]
  elsif m = /(^\d+)\s(.*)/.match(line)
    files[path + [m[2]]] = m[1].to_i
  end
end

# Walk the paths to accumulate file size in each dir
files.each do |f|
  f.first[0..-2].each_with_index do |d, i|
    sizes[f.first[0..i]] += f.last
  end
end

puts sizes.values.select { |v| v <= 100000 }.sum
