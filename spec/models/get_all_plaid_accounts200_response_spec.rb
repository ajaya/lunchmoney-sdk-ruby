require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::GetAllPlaidAccounts200Response do
  let(:valid_attributes) do
    {
      plaid_accounts: []
    }
  end

  let(:instance) { LunchMoney::GetAllPlaidAccounts200Response.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of GetAllPlaidAccounts200Response' do
      expect(instance).to be_instance_of(LunchMoney::GetAllPlaidAccounts200Response)
    end

    it 'sets all attributes from hash' do
      expect(instance.plaid_accounts).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::GetAllPlaidAccounts200Response.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::GetAllPlaidAccounts200Response.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::GetAllPlaidAccounts200Response.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::GetAllPlaidAccounts200Response.new(plaid_accounts: ['different'])
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:plaid_accounts]).to eq([])
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::GetAllPlaidAccounts200Response.build_from_hash(valid_attributes)
      expect(obj.plaid_accounts).to eq([])
    end
  end
end
