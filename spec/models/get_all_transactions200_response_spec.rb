require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::GetAllTransactions200Response do
  let(:valid_attributes) do
    {
      transactions: [],
      has_more: false,
      error: 'something went wrong'
    }
  end

  let(:instance) { LunchMoney::GetAllTransactions200Response.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of GetAllTransactions200Response' do
      expect(instance).to be_instance_of(LunchMoney::GetAllTransactions200Response)
    end

    it 'sets all attributes from hash' do
      expect(instance.transactions).to eq([])
      expect(instance.has_more).to eq(false)
      expect(instance.error).to eq('something went wrong')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::GetAllTransactions200Response.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::GetAllTransactions200Response.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when transactions is set to nil' do
      expect {
        instance.transactions = nil
      }.to raise_error(ArgumentError, /transactions cannot be nil/)
    end

    it 'raises when has_more is set to nil' do
      expect {
        instance.has_more = nil
      }.to raise_error(ArgumentError, /has_more cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::GetAllTransactions200Response.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::GetAllTransactions200Response.new(valid_attributes.merge(has_more: true))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:transactions]).to eq([])
      expect(hash[:has_more]).to eq(false)
      expect(hash[:error]).to eq('something went wrong')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::GetAllTransactions200Response.build_from_hash(valid_attributes)
      expect(obj.transactions).to eq([])
      expect(obj.has_more).to eq(false)
    end
  end
end
