require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpdateTransactionObject do
  let(:valid_attributes) do
    {
      id: 9001,
      date: Date.new(2025, 3, 5),
      amount: '45.9900',
      currency: 'usd',
      recurring_id: nil,
      payee: 'Updated Payee',
      original_name: nil,
      category_id: nil,
      notes: nil,
      manual_account_id: nil,
      plaid_account_id: nil,
      tag_ids: [1, 2],
      additional_tag_ids: [],
      external_id: nil,
      custom_metadata: nil,
      status: 'reviewed',
      to_base: 45.99,
      is_pending: false,
      plaid_metadata: nil,
      created_at: Time.parse('2025-03-05T18:00:00Z')
    }
  end

  let(:instance) { LunchMoney::UpdateTransactionObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UpdateTransactionObject' do
      expect(instance).to be_instance_of(LunchMoney::UpdateTransactionObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(9001)
      expect(instance.date).to eq(Date.new(2025, 3, 5))
      expect(instance.amount).to eq('45.9900')
      expect(instance.payee).to eq('Updated Payee')
      expect(instance.status).to eq('reviewed')
      expect(instance.is_pending).to eq(false)
      expect(instance.tag_ids).to eq([1, 2])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UpdateTransactionObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::UpdateTransactionObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows recurring_id to be nil' do
      attrs = valid_attributes.merge(recurring_id: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.recurring_id).to be_nil
    end

    it 'allows original_name to be nil' do
      attrs = valid_attributes.merge(original_name: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.original_name).to be_nil
    end

    it 'allows category_id to be nil' do
      attrs = valid_attributes.merge(category_id: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.category_id).to be_nil
    end

    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.notes).to be_nil
    end

    it 'allows manual_account_id to be nil' do
      attrs = valid_attributes.merge(manual_account_id: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.manual_account_id).to be_nil
    end

    it 'allows plaid_account_id to be nil' do
      attrs = valid_attributes.merge(plaid_account_id: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.plaid_account_id).to be_nil
    end

    it 'allows external_id to be nil' do
      attrs = valid_attributes.merge(external_id: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.external_id).to be_nil
    end

    it 'allows custom_metadata to be nil' do
      attrs = valid_attributes.merge(custom_metadata: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.custom_metadata).to be_nil
    end

    it 'allows plaid_metadata to be nil' do
      attrs = valid_attributes.merge(plaid_metadata: nil)
      obj = LunchMoney::UpdateTransactionObject.new(attrs)
      expect(obj.plaid_metadata).to be_nil
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UpdateTransactionObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UpdateTransactionObject.new(valid_attributes.merge(payee: 'Different'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(9001)
      expect(hash[:payee]).to eq('Updated Payee')
      expect(hash[:amount]).to eq('45.9900')
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
        payee: 'Updated Payee',
        status: 'reviewed',
        is_pending: false,
        tag_ids: [1, 2],
        created_at: '2025-03-05T18:00:00Z'
      }
      obj = LunchMoney::UpdateTransactionObject.build_from_hash(json_hash)
      expect(obj.id).to eq(9001)
      expect(obj.payee).to eq('Updated Payee')
    end
  end
end
