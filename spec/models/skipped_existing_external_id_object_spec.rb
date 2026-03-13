require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SkippedExistingExternalIdObject do
  let(:valid_attributes) do
    {
      reason: 'duplicate_external_id',
      request_transactions_index: 0,
      existing_transaction_id: 100
    }
  end

  let(:instance) { LunchMoney::SkippedExistingExternalIdObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SkippedExistingExternalIdObject' do
      expect(instance).to be_instance_of(LunchMoney::SkippedExistingExternalIdObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.reason).to eq('duplicate_external_id')
      expect(instance.request_transactions_index).to eq(0)
      expect(instance.existing_transaction_id).to eq(100)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SkippedExistingExternalIdObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SkippedExistingExternalIdObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SkippedExistingExternalIdObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SkippedExistingExternalIdObject.new(valid_attributes.merge(reason: 'duplicate_payee_amount_date'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:reason]).to eq('duplicate_external_id')
      expect(hash[:request_transactions_index]).to eq(0)
      expect(hash[:existing_transaction_id]).to eq(100)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        reason: 'duplicate_external_id',
        request_transactions_index: 0,
        existing_transaction_id: 100
      }
      obj = LunchMoney::SkippedExistingExternalIdObject.build_from_hash(json_hash)
      expect(obj.reason).to eq('duplicate_external_id')
      expect(obj.existing_transaction_id).to eq(100)
    end
  end
end
