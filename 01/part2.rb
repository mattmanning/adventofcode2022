puts File.read('input').split("\n\n").map {|elf| elf.split("\n").map(&:to_i).sum}.sort[-3..-1].sum
