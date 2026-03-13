require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::ChildTransactionObject do
  let(:valid_attributes) do
    {
      id: 5001,
      date: Date.new(2025, 3, 5),
      amount: '25.0000',
      currency: 'usd',
      to_base: 25.0,
      recurring_id: nil,
      payee: 'Coffee Shop',
      original_name: nil,
      category_id: 42,
      notes: nil,
      status: 'reviewed',
      is_pending: false,
      created_at: Time.parse('2025-03-05T18:00:00Z'),
      updated_at: Time.parse('2025-03-06T09:15:00Z'),
      is_split_parent: false,
      split_parent_id: nil,
      is_group_parent: false,
      group_parent_id: nil,
      manual_account_id: 5,
      plaid_account_id: nil,
      tag_ids: [1],
      source: 'manual',
      external_id: nil
    }
  end

  let(:instance) { LunchMoney::ChildTransactionObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of ChildTransactionObject' do
      expect(instance).to be_instance_of(LunchMoney::ChildTransactionObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(5001)
      expect(instance.date).to eq(Date.new(2025, 3, 5))
      expect(instance.amount).to eq('25.0000')
      expect(instance.currency).to eq('usd')
      expect(instance.to_base).to eq(25.0)
      expect(instance.payee).to eq('Coffee Shop')
      expect(instance.status).to eq('reviewed')
      expect(instance.is_pending).to eq(false)
      expect(instance.is_group_parent).to eq(false)
      expect(instance.tag_ids).to eq([1])
      expect(instance.source).to eq('manual')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::ChildTransactionObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::ChildTransactionObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows recurring_id to be nil' do
      attrs = valid_attributes.merge(recurring_id: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.recurring_id).to be_nil
    end

    it 'allows original_name to be nil' do
      attrs = valid_attributes.merge(original_name: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.original_name).to be_nil
    end

    it 'allows category_id to be nil' do
      attrs = valid_attributes.merge(category_id: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.category_id).to be_nil
    end

    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.notes).to be_nil
    end

    it 'allows split_parent_id to be nil' do
      attrs = valid_attributes.merge(split_parent_id: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.split_parent_id).to be_nil
    end

    it 'allows group_parent_id to be nil' do
      attrs = valid_attributes.merge(group_parent_id: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.group_parent_id).to be_nil
    end

    it 'allows manual_account_id to be nil' do
      attrs = valid_attributes.merge(manual_account_id: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.manual_account_id).to be_nil
    end

    it 'allows plaid_account_id to be nil' do
      attrs = valid_attributes.merge(plaid_account_id: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.plaid_account_id).to be_nil
    end

    it 'allows source to be nil' do
      attrs = valid_attributes.merge(source: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.source).to be_nil
    end

    it 'allows external_id to be nil' do
      attrs = valid_attributes.merge(external_id: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.external_id).to be_nil
    end

    it 'allows plaid_metadata to be nil' do
      attrs = valid_attributes.merge(plaid_metadata: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.plaid_metadata).to be_nil
    end

    it 'allows custom_metadata to be nil' do
      attrs = valid_attributes.merge(custom_metadata: nil)
      obj = LunchMoney::ChildTransactionObject.new(attrs)
      expect(obj.custom_metadata).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when id is set to nil' do
      expect {
        instance.id = nil
      }.to raise_error(ArgumentError, /id cannot be nil/)
    end

    it 'raises when date is set to nil' do
      expect {
        instance.date = nil
      }.to raise_error(ArgumentError, /date cannot be nil/)
    end

    it 'raises when amount is set to nil' do
      expect {
        instance.amount = nil
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end

    it 'raises when currency is set to nil' do
      expect {
        instance.currency = nil
      }.to raise_error(ArgumentError, /currency cannot be nil/)
    end

    it 'raises when to_base is set to nil' do
      expect {
        instance.to_base = nil
      }.to raise_error(ArgumentError, /to_base cannot be nil/)
    end

    it 'raises when payee is set to nil' do
      expect {
        instance.payee = nil
      }.to raise_error(ArgumentError, /payee cannot be nil/)
    end

    it 'allows status to be set to nil (enum validator permits nil)' do
      instance.status = nil
      expect(instance.status).to be_nil
    end

    it 'raises when is_pending is set to nil' do
      expect {
        instance.is_pending = nil
      }.to raise_error(ArgumentError, /is_pending cannot be nil/)
    end

    it 'raises when created_at is set to nil' do
      expect {
        instance.created_at = nil
      }.to raise_error(ArgumentError, /created_at cannot be nil/)
    end

    it 'raises when updated_at is set to nil' do
      expect {
        instance.updated_at = nil
      }.to raise_error(ArgumentError, /updated_at cannot be nil/)
    end

    it 'raises when is_group_parent is set to nil' do
      expect {
        instance.is_group_parent = nil
      }.to raise_error(ArgumentError, /is_group_parent cannot be nil/)
    end

    it 'raises when tag_ids is set to nil' do
      expect {
        instance.tag_ids = nil
      }.to raise_error(ArgumentError, /tag_ids cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::ChildTransactionObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::ChildTransactionObject.new(valid_attributes.merge(amount: '100.0000'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(5001)
      expect(hash[:amount]).to eq('25.0000')
      expect(hash[:payee]).to eq('Coffee Shop')
      expect(hash[:status]).to eq('reviewed')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 5001,
        date: '2025-03-05',
        amount: '25.0000',
        currency: 'usd',
        to_base: 25.0,
        payee: 'Coffee Shop',
        status: 'reviewed',
        is_pending: false,
        created_at: '2025-03-05T18:00:00Z',
        updated_at: '2025-03-06T09:15:00Z',
        is_split_parent: false,
        is_group_parent: false,
        tag_ids: [1]
      }
      obj = LunchMoney::ChildTransactionObject.build_from_hash(json_hash)
      expect(obj.id).to eq(5001)
      expect(obj.payee).to eq('Coffee Shop')
    end
  end
end
