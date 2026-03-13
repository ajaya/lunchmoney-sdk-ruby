require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryTotalsObject do
  let(:valid_attributes) do
    {
      inflow: {},
      outflow: {}
    }
  end

  let(:instance) { LunchMoney::SummaryTotalsObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryTotalsObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryTotalsObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.inflow).to eq({})
      expect(instance.outflow).to eq({})
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryTotalsObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryTotalsObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryTotalsObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryTotalsObject.new(valid_attributes.merge(inflow: { total: 100 }))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:inflow]).to eq({})
      expect(hash[:outflow]).to eq({})
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        inflow: {},
        outflow: {}
      }
      obj = LunchMoney::SummaryTotalsObject.build_from_hash(json_hash)
      expect(obj.inflow).to be_a(LunchMoney::SummaryTotalsBreakdownObject)
    end
  end
end
