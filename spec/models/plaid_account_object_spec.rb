require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::PlaidAccountObject do
  let(:valid_attributes) do
    {
      id: 300,
      plaid_item_id: nil,
      date_linked: Date.new(2024, 5, 20),
      linked_by_name: 'John Smith',
      name: 'Chase Checking',
      display_name: nil,
      type: 'depository',
      subtype: 'checking',
      mask: '4567',
      institution_name: 'Chase',
      status: 'active',
      allow_transaction_modifications: true,
      limit: nil,
      balance: '3250.75',
      currency: 'usd',
      to_base: 3250.75,
      balance_last_update: nil,
      import_start_date: nil,
      last_import: nil,
      last_fetch: nil,
      plaid_last_successful_update: nil
    }
  end

  let(:instance) { LunchMoney::PlaidAccountObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of PlaidAccountObject' do
      expect(instance).to be_instance_of(LunchMoney::PlaidAccountObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(300)
      expect(instance.date_linked).to eq(Date.new(2024, 5, 20))
      expect(instance.linked_by_name).to eq('John Smith')
      expect(instance.name).to eq('Chase Checking')
      expect(instance.type).to eq('depository')
      expect(instance.subtype).to eq('checking')
      expect(instance.mask).to eq('4567')
      expect(instance.institution_name).to eq('Chase')
      expect(instance.status).to eq('active')
      expect(instance.allow_transaction_modifications).to eq(true)
      expect(instance.balance).to eq('3250.75')
      expect(instance.currency).to eq('usd')
      expect(instance.to_base).to eq(3250.75)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::PlaidAccountObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::PlaidAccountObject.new(123)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows plaid_item_id to be nil' do
      attrs = valid_attributes.merge(plaid_item_id: nil)
      obj = LunchMoney::PlaidAccountObject.new(attrs)
      expect(obj.plaid_item_id).to be_nil
    end

    it 'allows display_name to be nil' do
      attrs = valid_attributes.merge(display_name: nil)
      obj = LunchMoney::PlaidAccountObject.new(attrs)
      expect(obj.display_name).to be_nil
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
      other = LunchMoney::PlaidAccountObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::PlaidAccountObject.new(valid_attributes.merge(name: 'Wells Fargo Savings'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(300)
      expect(hash[:name]).to eq('Chase Checking')
      expect(hash[:balance]).to eq('3250.75')
      expect(hash[:currency]).to eq('usd')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 300,
        date_linked: '2024-05-20',
        linked_by_name: 'John Smith',
        name: 'Chase Checking',
        type: 'depository',
        subtype: 'checking',
        mask: '4567',
        institution_name: 'Chase',
        status: 'active',
        allow_transaction_modifications: true,
        balance: '3250.75',
        currency: 'usd',
        to_base: 3250.75
      }
      obj = LunchMoney::PlaidAccountObject.build_from_hash(json_hash)
      expect(obj.id).to eq(300)
      expect(obj.name).to eq('Chase Checking')
    end
  end
end
