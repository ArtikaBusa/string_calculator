class Calculator
  class NegativeNumberError < StandardError; end

  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    values = numbers.split(delimiter).map(&:to_i)

    negatives = values.select { |n| n < 0 }
    raise NegativeNumberError, "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    values.sum
  end

  private

  def self.extract_delimiter(input)
    if input.start_with?("//")
      delimiter_line, numbers = input.split("\n", 2)
      delimiter = Regexp.escape(delimiter_line[2..])
      [ Regexp.union(delimiter, /[\n,]/), numbers ]
    else
      [ Regexp.union(/[\n,]/), input ]
    end
  end
end
