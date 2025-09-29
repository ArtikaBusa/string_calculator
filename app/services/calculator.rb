class Calculator
  class NegativeNumberError < StandardError; end
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..])
      numbers = parts[1]
    end

    nums = numbers.split(delimiter).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    raise NegativeNumberError, "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    nums.sum
  end
end
