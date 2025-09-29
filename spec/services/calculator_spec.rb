require "rails_helper"

RSpec.describe Calculator, type: :model do
  describe ".add" do
    it "returns 0 for empty string" do
      expect(described_class.add("")).to eq(0)
    end

    it "returns the number itself for single input" do
      expect(described_class.add("1")).to eq(1)
    end

    it "returns sum of two numbers" do
      expect(described_class.add("1,5")).to eq(6)
    end

    it "returns sum of multiple numbers" do
      expect(described_class.add("1,2,3,4,5")).to eq(15)
    end

    it "handles new line as delimiter" do
      expect(described_class.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiter" do
      expect(described_class.add("//;\n1;2")).to eq(3)
    end

    it "raises error for single negative number" do
      expect { described_class.add("1,-2,3") }
        .to raise_error(Calculator::NegativeNumberError, "negative numbers not allowed: -2")
    end

    it "raises error for multiple negative numbers" do
      expect { described_class.add("1,-2,-3,4") }
        .to raise_error(Calculator::NegativeNumberError, "negative numbers not allowed: -2, -3")
    end
  end
end
