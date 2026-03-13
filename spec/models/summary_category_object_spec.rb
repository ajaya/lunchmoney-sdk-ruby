require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryCategoryObject do
  let(:valid_attributes) do
    {
      category_id: 42,
      totals: {},
      occurrences: [],
      rollover_pool: nil
    }
  end

  let(:instance) { LunchMoney::SummaryCategoryObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryCategoryObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryCategoryObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.category_id).to eq(42)
      expect(instance.totals).to eq({})
      expect(instance.occurrences).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryCategoryObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryCategoryObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when category_id is set to nil' do
      expect {
        instance.category_id = nil
      }.to raise_error(ArgumentError, /category_id cannot be nil/)
    end

    it 'raises when totals is set to nil' do
      expect {
        instance.totals = nil
      }.to raise_error(ArgumentError, /totals cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryCategoryObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryCategoryObject.new(valid_attributes.merge(category_id: 99))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:category_id]).to eq(42)
      expect(hash[:totals]).to eq({})
    end
  end

  describe '.build_from_hash' do
    it 'raises because totals (complex type) is required but missing' do
      json_hash = {
        category_id: 42
      }
      expect {
        LunchMoney::SummaryCategoryObject.build_from_hash(json_hash)
      }.to raise_error(ArgumentError, /totals cannot be nil/)
    end
  end
end
