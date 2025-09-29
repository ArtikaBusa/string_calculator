class Calculator

  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i if numbers.size == 1
  end
end
