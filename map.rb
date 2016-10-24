def my_map(enumerable, &block)
  enumerable.each_with_object([]){|element, arr| arr << block.call(element)}
end

puts my_map(["foo", "bar"], &:upcase)
