hashes = []
array.each_with_index do |x,y|
  hash = {}
  if y == 0
    definition = x
    p definition
  end
  if y.odd?

    ans = x
    hash["definition"] = definition
    hash["ans"] = ans
    hashes <<  hash
  end
end

puts hashes
