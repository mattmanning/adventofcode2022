puts File.readlines('input').map {|str| (('a'..'z').to_a + ('A'..'Z').to_a).index(str.chars.each_slice(str.size/2).map {|s| s.uniq}.flatten.group_by { |char| char }.select { |key, value| value.size > 1 }.first[0]) + 1}.sum
