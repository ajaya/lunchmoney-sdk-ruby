require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::RecurringObjectMatchesFoundTransactionsInner do
  let(:valid_attributes) do
    {
      date: Date.new(2025, 2, 15),
      transaction_id: 98765
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.date).to eq(Date.new(2025, 2, 15))
      expect(obj.transaction_id).to eq(98765)
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(unknown: 'test') }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'required attributes raise when set to nil' do
    it 'allows date to be set to nil (no setter validation)' do
      obj = described_class.new(valid_attributes)
      obj.date = nil
      expect(obj.date).to be_nil
    end

    it 'allows transaction_id to be set to nil (no setter validation)' do
      obj = described_class.new(valid_attributes)
      obj.transaction_id = nil
      expect(obj.transaction_id).to be_nil
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
      obj2 = described_class.new(valid_attributes.merge(transaction_id: 11111))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:date]).to eq(Date.new(2025, 2, 15))
      expect(hash[:transaction_id]).to eq(98765)
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = { date: '2025-02-15', transaction_id: 98765 }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.date).to eq(Date.new(2025, 2, 15))
      expect(obj.transaction_id).to eq(98765)
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
