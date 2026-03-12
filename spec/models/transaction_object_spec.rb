require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::TransactionObject do
  let(:valid_attributes) do
    {
      id: 9001,
      date: Date.new(2025, 3, 5),
      amount: '45.9900',
      currency: 'usd',
      to_base: 45.99,
      recurring_id: nil,
      payee: 'Whole Foods Market',
      original_name: nil,
      category_id: 42,
      plaid_account_id: nil,
      manual_account_id: 5,
      external_id: nil,
      tag_ids: [1, 3],
      notes: nil,
      status: 'reviewed',
      is_pending: false,
      created_at: Time.parse('2025-03-05T18:00:00Z'),
      updated_at: Time.parse('2025-03-06T09:15:00Z'),
      is_split_parent: false,
      split_parent_id: nil,
      is_group_parent: false,
      group_parent_id: nil,
      source: 'manual'
    }
  end

  let(:instance) { LunchMoney::TransactionObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of TransactionObject' do
      expect(instance).to be_instance_of(LunchMoney::TransactionObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(9001)
      expect(instance.date).to eq(Date.new(2025, 3, 5))
      expect(instance.amount).to eq('45.9900')
      expect(instance.currency).to eq('usd')
      expect(instance.to_base).to eq(45.99)
      expect(instance.payee).to eq('Whole Foods Market')
      expect(instance.tag_ids).to eq([1, 3])
      expect(instance.status).to eq('reviewed')
      expect(instance.is_pending).to eq(false)
      expect(instance.is_group_parent).to eq(false)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::TransactionObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::TransactionObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows recurring_id to be nil' do
      attrs = valid_attributes.merge(recurring_id: nil)
      obj = LunchMoney::TransactionObject.new(attrs)
      expect(obj.recurring_id).to be_nil
    end

    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::TransactionObject.new(attrs)
      expect(obj.notes).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when id is set to nil' do
      expect {
        instance.id = nil
      }.to raise_error(ArgumentError, /id cannot be nil/)
    end

    it 'raises when payee is set to nil' do
      expect {
        instance.payee = nil
      }.to raise_error(ArgumentError, /payee cannot be nil/)
    end

    it 'raises when is_group_parent is set to nil' do
      expect {
        instance.is_group_parent = nil
      }.to raise_error(ArgumentError, /is_group_parent cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::TransactionObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::TransactionObject.new(valid_attributes.merge(amount: '100.0000'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(9001)
      expect(hash[:amount]).to eq('45.9900')
      expect(hash[:payee]).to eq('Whole Foods Market')
      expect(hash[:status]).to eq('reviewed')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 9001,
        date: '2025-03-05',
        amount: '45.9900',
        currency: 'usd',
        to_base: 45.99,
        payee: 'Whole Foods Market',
        tag_ids: [1, 3],
        status: 'reviewed',
        is_pending: false,
        created_at: '2025-03-05T18:00:00Z',
        updated_at: '2025-03-06T09:15:00Z',
        is_split_parent: false,
        is_group_parent: false,
        source: 'manual'
      }
      obj = LunchMoney::TransactionObject.build_from_hash(json_hash)
      expect(obj.id).to eq(9001)
      expect(obj.payee).to eq('Whole Foods Market')
    end
  end
end
