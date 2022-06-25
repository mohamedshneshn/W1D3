

def power_of_two?(num)
  product = 1

  while product < num
    product *= 2
  end

  product == num
end
