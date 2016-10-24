 = { "a" => 100, "b" => 200, :c => "c" }
puts h1
puts h1["a"]
puts h1["a".dup]
h1.compare_by_identity
puts h1.compare_by_identity?
puts h1["a"]
puts h1["a".dup]
