require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::RecurringObjectOverrides do
  let(:valid_attributes) do
    {
      payee: 'Netflix',
      notes: 'Streaming subscription',
      category_id: 78
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.payee).to eq('Netflix')
      expect(obj.notes).to eq('Streaming subscription')
      expect(obj.category_id).to eq(78)
    end

    it 'creates an instance with empty attributes (all optional)' do
      obj = described_class.new({})
      expect(obj).to be_a(described_class)
      expect(obj.payee).to be_nil
      expect(obj.notes).to be_nil
      expect(obj.category_id).to be_nil
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(invalid_attr: 123) }.to raise_error(ArgumentError, /not a valid attribute/)
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
      obj2 = described_class.new(valid_attributes.merge(payee: 'Hulu'))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:payee]).to eq('Netflix')
      expect(hash[:notes]).to eq('Streaming subscription')
      expect(hash[:category_id]).to eq(78)
    end

    it 'omits nil non-nullable attributes' do
      obj = described_class.new({})
      hash = obj.to_hash
      expect(hash).not_to have_key(:payee)
      expect(hash).not_to have_key(:notes)
      expect(hash).not_to have_key(:category_id)
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = { payee: 'Netflix', notes: 'Streaming subscription', category_id: 78 }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.payee).to eq('Netflix')
      expect(obj.category_id).to eq(78)
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
