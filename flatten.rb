def flatten(array)
  array.each_with_object([]) do |element, flattened|
    flattened.push *(element.is_a?(Array) ? flatten(element) : element)
  end
end

array=[1,2,3,[4,5],6,[7,[[8],9],10]]
require 'benchmark'
Benchmark.bm(10) do |x|
  x.report("kevin flatten1:") {flatten(array)}
  x.report("ruby flatten:") {array.flatten}
end
