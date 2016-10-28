def my_map(enumerable, &block)
  enumerable.each_with_object([]){|element, arr| arr << block.call(element)}
end

class Array
  def my_map
    self.each_with_object([]){|elem, array| array.push(yield elem) }
  end
end


require "benchmark"
Benchmark.bm(10) do |x|
  x.report("kevin map function: "){
    puts ""
    array = my_map(["foo", "bar"], &:upcase)
    print array
    puts ""
  }
  x.report("kevin array map: "){
    puts ""
    array = ["foo", "bar"].my_map do |elem|
      elem.upcase
    end
    print array
    puts ""
  }
  x.report("ruby map: "){
    puts ""
    arr = ["foo","bar"].map do |elem|
      elem.upcase
    end
    print arr
    puts ""
  }
end


