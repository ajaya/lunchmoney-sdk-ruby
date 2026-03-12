require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpdateTransactionsRequest do
  let(:valid_attributes) do
    {
      transactions: [{ id: 101, payee: 'Updated Payee' }]
    }
  end

  let(:instance) { LunchMoney::UpdateTransactionsRequest.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UpdateTransactionsRequest' do
      expect(instance).to be_instance_of(LunchMoney::UpdateTransactionsRequest)
    end

    it 'sets all attributes from hash' do
      expect(instance.transactions).to be_an(Array)
      expect(instance.transactions.length).to eq(1)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UpdateTransactionsRequest.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::UpdateTransactionsRequest.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when transactions is set to nil' do
      expect {
        instance.transactions = nil
      }.to raise_error(ArgumentError, /transactions cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UpdateTransactionsRequest.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UpdateTransactionsRequest.new(transactions: [{ id: 999, payee: 'Other' }])
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:transactions]).to be_an(Array)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::UpdateTransactionsRequest.build_from_hash(valid_attributes)
      expect(obj.transactions.length).to eq(1)
    end
  end
end
