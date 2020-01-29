require 'pry'

x, n = gets.split(' ').map(&:to_i)
w = gets.split(' ').map(&:to_i)
fail 'problem with paraser' if w.count != n

m = Array.new(n+1) { Array.new(x) { 0 } }

(0...n).each do |i|
  x.times do |j|
    if w[i] > j
      m[i + 1][j] = m[i][j]
    else
      m[i + 1][j] = [m[i][j], m[i][j - w[i]] + w[i]].max
    end
  end
end

j = x - 1
r = []
(0...n).to_a.reverse.each do |i|
  next if j < w[i]
  j = m[i + 1][j - w[i]]
  r << i
end

p r.count
puts r.join(' ')
