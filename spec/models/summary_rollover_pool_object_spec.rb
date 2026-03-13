require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryRolloverPoolObject do
  let(:valid_attributes) do
    {
      budgeted_to_base: 500.0,
      all_adjustments: []
    }
  end

  let(:instance) { LunchMoney::SummaryRolloverPoolObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryRolloverPoolObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryRolloverPoolObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.budgeted_to_base).to eq(500.0)
      expect(instance.all_adjustments).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryRolloverPoolObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryRolloverPoolObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when budgeted_to_base is set to nil' do
      expect {
        instance.budgeted_to_base = nil
      }.to raise_error(ArgumentError, /budgeted_to_base cannot be nil/)
    end

    it 'raises when all_adjustments is set to nil' do
      expect {
        instance.all_adjustments = nil
      }.to raise_error(ArgumentError, /all_adjustments cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryRolloverPoolObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryRolloverPoolObject.new(valid_attributes.merge(budgeted_to_base: 999.0))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:budgeted_to_base]).to eq(500.0)
      expect(hash[:all_adjustments]).to eq([])
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        budgeted_to_base: 500.0,
        all_adjustments: []
      }
      obj = LunchMoney::SummaryRolloverPoolObject.build_from_hash(json_hash)
      expect(obj.budgeted_to_base).to eq(500.0)
      expect(obj.all_adjustments).to eq([])
    end
  end
end
