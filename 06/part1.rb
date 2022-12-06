str = File.read('input')
x = 0
y = 3

while true
  if str[x..y].split('').uniq.length == 4
    puts y+1
    break
  else
    x += 1
    y += 1
  end
end
