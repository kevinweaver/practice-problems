def parse_json(hash)

  str=""
  hash.each do |key, value|
    value.each_with_index do |x, index|
      x = parse_json(x) if x.is_a? Hash
      str << x.to_s + " "
      if (value.length - 1) != index
        if key == "and"
          str << "&& "
        elsif key == "or"
          str << "|| "
        end
      end
    end
  end
  print str
  return eval(str)
end
value =  {
   "and" => [
       {
             "or" => [
                     true,
                     false
                   ]
           },
       {
                 "and" => [
                         false,
                         false,
                         false
                       ]
               }
     ]
 }
value2 = {
  "and": [
      true,
      false,
      true
    ]
}
parse_json(value2)
