require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::CreateManualAccountRequestObject do
  let(:valid_attributes) do
    {
      name: 'Savings',
      type: 'depository',
      balance: { amount: '1000.00', currency: 'usd' }
    }
  end

  let(:instance) { LunchMoney::CreateManualAccountRequestObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of CreateManualAccountRequestObject' do
      expect(instance).to be_instance_of(LunchMoney::CreateManualAccountRequestObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.name).to eq('Savings')
      expect(instance.type).to eq('depository')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::CreateManualAccountRequestObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::CreateManualAccountRequestObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows balance_as_of to be nil' do
      attrs = valid_attributes.merge(balance_as_of: nil)
      obj = LunchMoney::CreateManualAccountRequestObject.new(attrs)
      expect(obj.balance_as_of).to be_nil
    end

    it 'allows closed_on to be nil' do
      attrs = valid_attributes.merge(closed_on: nil)
      obj = LunchMoney::CreateManualAccountRequestObject.new(attrs)
      expect(obj.closed_on).to be_nil
    end

    it 'allows external_id to be nil' do
      attrs = valid_attributes.merge(external_id: nil)
      obj = LunchMoney::CreateManualAccountRequestObject.new(attrs)
      expect(obj.external_id).to be_nil
    end

    it 'allows custom_metadata to be nil' do
      attrs = valid_attributes.merge(custom_metadata: nil)
      obj = LunchMoney::CreateManualAccountRequestObject.new(attrs)
      expect(obj.custom_metadata).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when name is set to nil' do
      expect {
        instance.name = nil
      }.to raise_error(ArgumentError, /name cannot be nil/)
    end

    it 'raises when type is set to nil' do
      expect {
        instance.type = nil
      }.to raise_error(ArgumentError, /type cannot be nil/)
    end

    it 'raises when balance is set to nil' do
      expect {
        instance.balance = nil
      }.to raise_error(ArgumentError, /balance cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::CreateManualAccountRequestObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::CreateManualAccountRequestObject.new(valid_attributes.merge(name: 'Checking'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:name]).to eq('Savings')
      expect(hash[:type]).to eq('depository')
    end
  end

  describe '.build_from_hash' do
    it 'raises because balance (complex type) is required but missing from simple hash' do
      json_hash = {
        name: 'Savings',
        type: 'cash'
      }
      expect {
        LunchMoney::CreateManualAccountRequestObject.build_from_hash(json_hash)
      }.to raise_error(ArgumentError, /balance cannot be nil/)
    end
  end
end
