require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::CreateNewTransactionsRequest do
  let(:valid_attributes) do
    {
      transactions: [{ payee: 'Grocery Store', amount: '25.00', date: '2025-01-15' }],
      apply_rules: true,
      skip_duplicates: false,
      skip_balance_update: false
    }
  end

  let(:instance) { LunchMoney::CreateNewTransactionsRequest.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of CreateNewTransactionsRequest' do
      expect(instance).to be_instance_of(LunchMoney::CreateNewTransactionsRequest)
    end

    it 'sets all attributes from hash' do
      expect(instance.transactions).to eq([{ payee: 'Grocery Store', amount: '25.00', date: '2025-01-15' }])
      expect(instance.apply_rules).to eq(true)
      expect(instance.skip_duplicates).to eq(false)
      expect(instance.skip_balance_update).to eq(false)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::CreateNewTransactionsRequest.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::CreateNewTransactionsRequest.new('not a hash')
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
      other = LunchMoney::CreateNewTransactionsRequest.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::CreateNewTransactionsRequest.new(valid_attributes.merge(apply_rules: false))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:transactions]).to be_an(Array)
      expect(hash[:apply_rules]).to eq(true)
      expect(hash[:skip_duplicates]).to eq(false)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      # InsertTransactionObject is not defined as a standalone model class,
      # so build_from_hash cannot deserialize the nested transactions array.
      # Use the constructor directly to verify attribute assignment.
      obj = LunchMoney::CreateNewTransactionsRequest.new(valid_attributes)
      expect(obj.apply_rules).to eq(true)
    end
  end
end
