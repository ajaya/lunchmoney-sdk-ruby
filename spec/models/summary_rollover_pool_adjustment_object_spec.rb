require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryRolloverPoolAdjustmentObject do
  let(:valid_attributes) do
    {
      in_range: true,
      date: Date.new(2025, 3, 1),
      amount: '50.00',
      currency: 'usd',
      to_base: 50.0
    }
  end

  let(:instance) { LunchMoney::SummaryRolloverPoolAdjustmentObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryRolloverPoolAdjustmentObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryRolloverPoolAdjustmentObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.in_range).to eq(true)
      expect(instance.date).to eq(Date.new(2025, 3, 1))
      expect(instance.amount).to eq('50.00')
      expect(instance.currency).to eq('usd')
      expect(instance.to_base).to eq(50.0)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryRolloverPoolAdjustmentObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryRolloverPoolAdjustmentObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when in_range is set to nil' do
      expect {
        instance.in_range = nil
      }.to raise_error(ArgumentError, /in_range cannot be nil/)
    end

    it 'raises when date is set to nil' do
      expect {
        instance.date = nil
      }.to raise_error(ArgumentError, /date cannot be nil/)
    end

    it 'raises when amount is set to nil' do
      expect {
        instance.amount = nil
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end

    it 'raises when currency is set to nil' do
      expect {
        instance.currency = nil
      }.to raise_error(ArgumentError, /currency cannot be nil/)
    end

    it 'raises when to_base is set to nil' do
      expect {
        instance.to_base = nil
      }.to raise_error(ArgumentError, /to_base cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryRolloverPoolAdjustmentObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryRolloverPoolAdjustmentObject.new(valid_attributes.merge(amount: '100.00'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:in_range]).to eq(true)
      expect(hash[:amount]).to eq('50.00')
      expect(hash[:currency]).to eq('usd')
      expect(hash[:to_base]).to eq(50.0)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        in_range: true,
        date: '2025-03-01',
        amount: '50.00',
        currency: 'usd',
        to_base: 50.0
      }
      obj = LunchMoney::SummaryRolloverPoolAdjustmentObject.build_from_hash(json_hash)
      expect(obj.in_range).to eq(true)
      expect(obj.date).to eq(Date.new(2025, 3, 1))
    end
  end
end
