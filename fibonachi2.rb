def fizzbuzz(max)
  (1..max).each do |int|
    x = ""
    x+='Fizz' if int % 3 == 0
    x+='Bizz' if int % 5 == 0
    puts (x.empty? ? int : x)
  end
end

fizzbuzz(100)
