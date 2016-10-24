def fizzbuzz(a)
  (1..a).each do |i|
    #x = ''
    x += 'Fizz' if i%3==0
    x += 'Buzz' if i%5==0
    puts(x.nil? ? i : x)
	end
end

fizzbuzz(100)
