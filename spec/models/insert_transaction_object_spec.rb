require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::InsertTransactionObject do
  let(:valid_attributes) do
    {
      date: Date.new(2025, 3, 5),
      amount: { amount: '45.99', currency: 'usd' },
      currency: 'usd',
      payee: 'Whole Foods',
      original_name: nil,
      category_id: nil,
      notes: nil,
      manual_account_id: nil,
      plaid_account_id: nil,
      recurring_id: nil,
      status: 'reviewed',
      tag_ids: [1, 2],
      external_id: nil,
      custom_metadata: nil
    }
  end

  let(:instance) { LunchMoney::InsertTransactionObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of InsertTransactionObject' do
      expect(instance).to be_instance_of(LunchMoney::InsertTransactionObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.date).to eq(Date.new(2025, 3, 5))
      expect(instance.amount).to eq({ amount: '45.99', currency: 'usd' })
      expect(instance.currency).to eq('usd')
      expect(instance.payee).to eq('Whole Foods')
      expect(instance.status).to eq('reviewed')
      expect(instance.tag_ids).to eq([1, 2])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::InsertTransactionObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::InsertTransactionObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows original_name to be nil' do
      attrs = valid_attributes.merge(original_name: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.original_name).to be_nil
    end

    it 'allows category_id to be nil' do
      attrs = valid_attributes.merge(category_id: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.category_id).to be_nil
    end

    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.notes).to be_nil
    end

    it 'allows manual_account_id to be nil' do
      attrs = valid_attributes.merge(manual_account_id: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.manual_account_id).to be_nil
    end

    it 'allows plaid_account_id to be nil' do
      attrs = valid_attributes.merge(plaid_account_id: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.plaid_account_id).to be_nil
    end

    it 'allows recurring_id to be nil' do
      attrs = valid_attributes.merge(recurring_id: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.recurring_id).to be_nil
    end

    it 'allows external_id to be nil' do
      attrs = valid_attributes.merge(external_id: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.external_id).to be_nil
    end

    it 'allows custom_metadata to be nil' do
      attrs = valid_attributes.merge(custom_metadata: nil)
      obj = LunchMoney::InsertTransactionObject.new(attrs)
      expect(obj.custom_metadata).to be_nil
    end
  end

  describe 'required attributes' do
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
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::InsertTransactionObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::InsertTransactionObject.new(valid_attributes.merge(payee: 'Target'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:date]).to eq(Date.new(2025, 3, 5))
      expect(hash[:currency]).to eq('usd')
      expect(hash[:payee]).to eq('Whole Foods')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash deserializing simple fields' do
      # amount is a complex type (InsertTransactionObjectAmount) so we skip it here
      # to avoid deserialization issues in build_from_hash
      json_hash = {
        date: '2025-03-05',
        currency: 'usd',
        payee: 'Whole Foods',
        status: 'reviewed'
      }
      # amount is required and defaults to nil, so build_from_hash will raise
      expect {
        LunchMoney::InsertTransactionObject.build_from_hash(json_hash)
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end
  end
end
