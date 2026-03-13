require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpdateManualAccountRequestObject do
  let(:valid_attributes) do
    {
      name: 'Updated Savings',
      institution_name: nil,
      display_name: nil,
      type: 'depository',
      subtype: 'savings',
      balance: '10000.00',
      currency: 'usd',
      balance_as_of: nil,
      status: 'active',
      closed_on: nil,
      external_id: nil,
      custom_metadata: nil,
      exclude_from_transactions: false,
      to_base: 10000.0,
      created_at: Time.parse('2024-01-10T08:00:00Z'),
      updated_at: Time.parse('2025-02-28T16:45:00Z'),
      created_by_name: 'Jane Doe',
      id: 200
    }
  end

  let(:instance) { LunchMoney::UpdateManualAccountRequestObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UpdateManualAccountRequestObject' do
      expect(instance).to be_instance_of(LunchMoney::UpdateManualAccountRequestObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.name).to eq('Updated Savings')
      expect(instance.type).to eq('depository')
      expect(instance.balance).to eq('10000.00')
      expect(instance.currency).to eq('usd')
      expect(instance.status).to eq('active')
      expect(instance.to_base).to eq(10000.0)
      expect(instance.created_by_name).to eq('Jane Doe')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UpdateManualAccountRequestObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::UpdateManualAccountRequestObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows institution_name to be nil' do
      attrs = valid_attributes.merge(institution_name: nil)
      obj = LunchMoney::UpdateManualAccountRequestObject.new(attrs)
      expect(obj.institution_name).to be_nil
    end

    it 'allows display_name to be nil' do
      attrs = valid_attributes.merge(display_name: nil)
      obj = LunchMoney::UpdateManualAccountRequestObject.new(attrs)
      expect(obj.display_name).to be_nil
    end

    it 'allows balance_as_of to be nil' do
      attrs = valid_attributes.merge(balance_as_of: nil)
      obj = LunchMoney::UpdateManualAccountRequestObject.new(attrs)
      expect(obj.balance_as_of).to be_nil
    end

    it 'allows closed_on to be nil' do
      attrs = valid_attributes.merge(closed_on: nil)
      obj = LunchMoney::UpdateManualAccountRequestObject.new(attrs)
      expect(obj.closed_on).to be_nil
    end

    it 'allows external_id to be nil' do
      attrs = valid_attributes.merge(external_id: nil)
      obj = LunchMoney::UpdateManualAccountRequestObject.new(attrs)
      expect(obj.external_id).to be_nil
    end

    it 'allows custom_metadata to be nil' do
      attrs = valid_attributes.merge(custom_metadata: nil)
      obj = LunchMoney::UpdateManualAccountRequestObject.new(attrs)
      expect(obj.custom_metadata).to be_nil
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UpdateManualAccountRequestObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UpdateManualAccountRequestObject.new(valid_attributes.merge(name: 'Different'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:name]).to eq('Updated Savings')
      expect(hash[:type]).to eq('depository')
      expect(hash[:balance]).to eq('10000.00')
      expect(hash[:status]).to eq('active')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        name: 'Updated Savings',
        type: 'cash',
        balance: '10000.00',
        currency: 'usd',
        to_base: 10000.0,
        status: 'active',
        exclude_from_transactions: false,
        created_by_name: 'Jane Doe',
        created_at: '2024-01-10T08:00:00Z',
        updated_at: '2025-02-28T16:45:00Z',
        id: 200
      }
      obj = LunchMoney::UpdateManualAccountRequestObject.build_from_hash(json_hash)
      expect(obj.name).to eq('Updated Savings')
      expect(obj.id).to eq(200)
    end
  end
end
