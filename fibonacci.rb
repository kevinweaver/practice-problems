def fibonachi(last)
  (1..last).inject([0,1]) {|fib| fib << fib.last(2).inject(:+)}
end

puts fibonachi(10)
