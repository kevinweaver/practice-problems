def map(elem, &block)
  elem.each_with_object([]) {|elem,array| array << block.call(elem)}
end

array = ["a", "b", "f"]
require 'benchmark'
Benchmark.bm(10) do |x|
  x.report{ print map(array, &:upcase) }
end
