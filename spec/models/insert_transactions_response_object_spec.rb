require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::InsertTransactionsResponseObject do
  let(:valid_attributes) do
    {
      transactions: [1, 2, 3],
      skipped_duplicates: []
    }
  end

  let(:instance) { LunchMoney::InsertTransactionsResponseObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of InsertTransactionsResponseObject' do
      expect(instance).to be_instance_of(LunchMoney::InsertTransactionsResponseObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.transactions).to eq([1, 2, 3])
      expect(instance.skipped_duplicates).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::InsertTransactionsResponseObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::InsertTransactionsResponseObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when transactions is set to nil' do
      expect {
        instance.transactions = nil
      }.to raise_error(ArgumentError, /transactions cannot be nil/)
    end

    it 'raises when skipped_duplicates is set to nil' do
      expect {
        instance.skipped_duplicates = nil
      }.to raise_error(ArgumentError, /skipped_duplicates cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::InsertTransactionsResponseObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::InsertTransactionsResponseObject.new(valid_attributes.merge(transactions: [4, 5]))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:transactions]).to eq([1, 2, 3])
      expect(hash[:skipped_duplicates]).to eq([])
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with empty arrays' do
      json_hash = {
        transactions: [],
        skipped_duplicates: []
      }
      obj = LunchMoney::InsertTransactionsResponseObject.build_from_hash(json_hash)
      expect(obj.transactions).to eq([])
      expect(obj.skipped_duplicates).to eq([])
    end
  end
end
