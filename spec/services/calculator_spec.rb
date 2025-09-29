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

  end
end
