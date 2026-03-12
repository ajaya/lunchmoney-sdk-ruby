require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryResponseObject do
  let(:valid_attributes) do
    {
      aligned: true,
      categories: ['category_1', 'category_2']
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.aligned).to eq(true)
      expect(obj.categories).to eq(['category_1', 'category_2'])
      expect(obj.totals).to be_nil
      expect(obj.rollover_pool).to be_nil
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(budget_period: 'monthly') }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'required attributes raise on nil' do
    it 'raises when aligned is set to nil' do
      expect { described_class.new(valid_attributes).aligned = nil }.to raise_error(ArgumentError, /aligned cannot be nil/)
    end

    it 'raises when categories is set to nil' do
      expect { described_class.new(valid_attributes).categories = nil }.to raise_error(ArgumentError, /categories cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with the same attributes equal' do
      obj1 = described_class.new(valid_attributes)
      obj2 = described_class.new(valid_attributes)
      expect(obj1).to eq(obj2)
    end

    it 'considers objects with different attributes not equal' do
      obj1 = described_class.new(valid_attributes)
      obj2 = described_class.new(valid_attributes.merge(aligned: false))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:aligned]).to eq(true)
      expect(hash[:categories]).to eq(['category_1', 'category_2'])
    end

    it 'omits nil non-nullable optional attributes' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash).not_to have_key(:totals)
      expect(hash).not_to have_key(:rollover_pool)
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = {
        aligned: false,
        categories: []
      }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.aligned).to eq(false)
      expect(obj.categories).to eq([])
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
