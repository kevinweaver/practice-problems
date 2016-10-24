def sort names
  puts names.keys.map(&:to_s).sort_by(&:length)
end

sort({name: 'Bart', 'Lis' => 123, 'Maggie' => 456})
