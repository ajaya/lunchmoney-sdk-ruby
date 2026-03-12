require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::GetAllManualAccounts200Response do
  let(:valid_attributes) do
    {
      manual_accounts: []
    }
  end

  let(:instance) { LunchMoney::GetAllManualAccounts200Response.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of GetAllManualAccounts200Response' do
      expect(instance).to be_instance_of(LunchMoney::GetAllManualAccounts200Response)
    end

    it 'sets all attributes from hash' do
      expect(instance.manual_accounts).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::GetAllManualAccounts200Response.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::GetAllManualAccounts200Response.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::GetAllManualAccounts200Response.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::GetAllManualAccounts200Response.new(manual_accounts: ['different'])
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:manual_accounts]).to eq([])
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::GetAllManualAccounts200Response.build_from_hash(valid_attributes)
      expect(obj.manual_accounts).to eq([])
    end
  end
end
