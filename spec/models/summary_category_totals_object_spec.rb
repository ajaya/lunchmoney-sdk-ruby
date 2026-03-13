require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryCategoryTotalsObject do
  let(:valid_attributes) do
    {
      other_activity: 100.0,
      recurring_activity: 50.0,
      budgeted: nil,
      available: nil,
      recurring_remaining: 25.0,
      recurring_expected: 75.0
    }
  end

  let(:instance) { LunchMoney::SummaryCategoryTotalsObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryCategoryTotalsObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryCategoryTotalsObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.other_activity).to eq(100.0)
      expect(instance.recurring_activity).to eq(50.0)
      expect(instance.recurring_remaining).to eq(25.0)
      expect(instance.recurring_expected).to eq(75.0)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryCategoryTotalsObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryCategoryTotalsObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows budgeted to be nil' do
      attrs = valid_attributes.merge(budgeted: nil)
      obj = LunchMoney::SummaryCategoryTotalsObject.new(attrs)
      expect(obj.budgeted).to be_nil
    end

    it 'allows available to be nil' do
      attrs = valid_attributes.merge(available: nil)
      obj = LunchMoney::SummaryCategoryTotalsObject.new(attrs)
      expect(obj.available).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when other_activity is set to nil' do
      expect {
        instance.other_activity = nil
      }.to raise_error(ArgumentError, /other_activity cannot be nil/)
    end

    it 'raises when recurring_activity is set to nil' do
      expect {
        instance.recurring_activity = nil
      }.to raise_error(ArgumentError, /recurring_activity cannot be nil/)
    end

    it 'raises when recurring_remaining is set to nil' do
      expect {
        instance.recurring_remaining = nil
      }.to raise_error(ArgumentError, /recurring_remaining cannot be nil/)
    end

    it 'raises when recurring_expected is set to nil' do
      expect {
        instance.recurring_expected = nil
      }.to raise_error(ArgumentError, /recurring_expected cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryCategoryTotalsObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryCategoryTotalsObject.new(valid_attributes.merge(other_activity: 999.0))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:other_activity]).to eq(100.0)
      expect(hash[:recurring_activity]).to eq(50.0)
      expect(hash[:recurring_remaining]).to eq(25.0)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        other_activity: 100.0,
        recurring_activity: 50.0,
        recurring_remaining: 25.0,
        recurring_expected: 75.0
      }
      obj = LunchMoney::SummaryCategoryTotalsObject.build_from_hash(json_hash)
      expect(obj.other_activity).to eq(100.0)
      expect(obj.recurring_remaining).to eq(25.0)
    end
  end
end
