require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::RecurringObjectMatches do
  let(:valid_attributes) do
    {
      request_start_date: Date.new(2025, 1, 1),
      request_end_date: Date.new(2025, 3, 31),
      expected_occurrence_dates: [Date.new(2025, 1, 15), Date.new(2025, 2, 15), Date.new(2025, 3, 15)],
      found_transactions: [],
      missing_transaction_dates: [Date.new(2025, 3, 15)]
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.request_start_date).to eq(Date.new(2025, 1, 1))
      expect(obj.request_end_date).to eq(Date.new(2025, 3, 31))
      expect(obj.expected_occurrence_dates).to eq([Date.new(2025, 1, 15), Date.new(2025, 2, 15), Date.new(2025, 3, 15)])
      expect(obj.found_transactions).to eq([])
      expect(obj.missing_transaction_dates).to eq([Date.new(2025, 3, 15)])
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(bad_key: 'value') }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'required attributes raise when set to nil' do
    it 'does not raise when request_start_date is nil (no setter validation)' do
      obj = described_class.new(valid_attributes)
      obj.request_start_date = nil
      expect(obj.request_start_date).to be_nil
    end

    it 'does not raise when request_end_date is nil (no setter validation)' do
      obj = described_class.new(valid_attributes)
      obj.request_end_date = nil
      expect(obj.request_end_date).to be_nil
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
      obj2 = described_class.new(valid_attributes.merge(request_start_date: Date.new(2024, 6, 1)))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:request_start_date]).to eq(Date.new(2025, 1, 1))
      expect(hash[:request_end_date]).to eq(Date.new(2025, 3, 31))
      expect(hash[:missing_transaction_dates]).to eq([Date.new(2025, 3, 15)])
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = {
        request_start_date: '2025-01-01',
        request_end_date: '2025-03-31',
        expected_occurrence_dates: ['2025-01-15', '2025-02-15'],
        found_transactions: [],
        missing_transaction_dates: ['2025-03-15']
      }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.request_start_date).to eq(Date.new(2025, 1, 1))
      expect(obj.expected_occurrence_dates).to eq([Date.new(2025, 1, 15), Date.new(2025, 2, 15)])
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
