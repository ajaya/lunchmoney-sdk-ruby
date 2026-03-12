require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::ManualAccountObject do
  let(:valid_attributes) do
    {
      id: 200,
      name: 'Savings Account',
      institution_name: nil,
      display_name: nil,
      type: 'depository',
      subtype: nil,
      balance: '15000.50',
      currency: 'usd',
      to_base: 15000.50,
      balance_as_of: Time.parse('2025-03-01T00:00:00Z'),
      status: 'active',
      closed_on: nil,
      external_id: nil,
      custom_metadata: nil,
      exclude_from_transactions: false,
      created_by_name: 'Jane Doe',
      created_at: Time.parse('2024-01-10T08:00:00Z'),
      updated_at: Time.parse('2025-02-28T16:45:00Z')
    }
  end

  let(:instance) { LunchMoney::ManualAccountObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of ManualAccountObject' do
      expect(instance).to be_instance_of(LunchMoney::ManualAccountObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(200)
      expect(instance.name).to eq('Savings Account')
      expect(instance.type).to eq('depository')
      expect(instance.balance).to eq('15000.50')
      expect(instance.currency).to eq('usd')
      expect(instance.to_base).to eq(15000.50)
      expect(instance.status).to eq('active')
      expect(instance.exclude_from_transactions).to eq(false)
      expect(instance.created_by_name).to eq('Jane Doe')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::ManualAccountObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::ManualAccountObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows institution_name to be nil' do
      attrs = valid_attributes.merge(institution_name: nil)
      obj = LunchMoney::ManualAccountObject.new(attrs)
      expect(obj.institution_name).to be_nil
    end

    it 'allows custom_metadata to be nil' do
      attrs = valid_attributes.merge(custom_metadata: nil)
      obj = LunchMoney::ManualAccountObject.new(attrs)
      expect(obj.custom_metadata).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when id is set to nil' do
      expect {
        instance.id = nil
      }.to raise_error(ArgumentError, /id cannot be nil/)
    end

    it 'raises when name is set to nil' do
      expect {
        instance.name = nil
      }.to raise_error(ArgumentError, /name cannot be nil/)
    end

    it 'raises when balance is set to nil' do
      expect {
        instance.balance = nil
      }.to raise_error(ArgumentError, /balance cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::ManualAccountObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::ManualAccountObject.new(valid_attributes.merge(balance: '999.00'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(200)
      expect(hash[:name]).to eq('Savings Account')
      expect(hash[:balance]).to eq('15000.50')
      expect(hash[:status]).to eq('active')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 200,
        name: 'Savings Account',
        type: 'cash',
        balance: '15000.50',
        currency: 'usd',
        to_base: 15000.50,
        balance_as_of: '2025-03-01T00:00:00Z',
        status: 'active',
        exclude_from_transactions: false,
        created_by_name: 'Jane Doe',
        created_at: '2024-01-10T08:00:00Z',
        updated_at: '2025-02-28T16:45:00Z'
      }
      obj = LunchMoney::ManualAccountObject.build_from_hash(json_hash)
      expect(obj.id).to eq(200)
      expect(obj.name).to eq('Savings Account')
    end
  end
end
