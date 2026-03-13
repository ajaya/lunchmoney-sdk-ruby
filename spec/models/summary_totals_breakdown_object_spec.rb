require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryTotalsBreakdownObject do
  let(:valid_attributes) do
    {
      other_activity: 100.0,
      recurring_activity: 50.0,
      recurring_remaining: 25.0,
      recurring_expected: 75.0,
      uncategorized: 10.0,
      uncategorized_count: 3,
      uncategorized_recurring: 5.0
    }
  end

  let(:instance) { LunchMoney::SummaryTotalsBreakdownObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryTotalsBreakdownObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryTotalsBreakdownObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.other_activity).to eq(100.0)
      expect(instance.recurring_activity).to eq(50.0)
      expect(instance.recurring_remaining).to eq(25.0)
      expect(instance.recurring_expected).to eq(75.0)
      expect(instance.uncategorized).to eq(10.0)
      expect(instance.uncategorized_count).to eq(3)
      expect(instance.uncategorized_recurring).to eq(5.0)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryTotalsBreakdownObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryTotalsBreakdownObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryTotalsBreakdownObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryTotalsBreakdownObject.new(valid_attributes.merge(other_activity: 999.0))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:other_activity]).to eq(100.0)
      expect(hash[:recurring_activity]).to eq(50.0)
      expect(hash[:uncategorized]).to eq(10.0)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        other_activity: 100.0,
        recurring_activity: 50.0
      }
      obj = LunchMoney::SummaryTotalsBreakdownObject.build_from_hash(json_hash)
      expect(obj.other_activity).to eq(100.0)
      expect(obj.recurring_activity).to eq(50.0)
    end
  end
end
