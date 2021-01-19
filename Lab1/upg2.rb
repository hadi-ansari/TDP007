def fac(n)
  (1..n).inject {|total,x| total * x}
end

puts (1..3).inject {|total,x| total * x}
puts (3..5).reduce(:*)

puts fac(20)
