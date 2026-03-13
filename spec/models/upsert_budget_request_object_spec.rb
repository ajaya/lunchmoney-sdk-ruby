require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpsertBudgetRequestObject do
  let(:valid_attributes) do
    {
      start_date: Date.new(2025, 3, 1),
      category_id: 42,
      amount: { amount: '500.00', currency: 'usd' },
      currency: 'usd',
      notes: nil
    }
  end

  let(:instance) { LunchMoney::UpsertBudgetRequestObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UpsertBudgetRequestObject' do
      expect(instance).to be_instance_of(LunchMoney::UpsertBudgetRequestObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.start_date).to eq(Date.new(2025, 3, 1))
      expect(instance.category_id).to eq(42)
      expect(instance.amount).to eq({ amount: '500.00', currency: 'usd' })
      expect(instance.currency).to eq('usd')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UpsertBudgetRequestObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::UpsertBudgetRequestObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::UpsertBudgetRequestObject.new(attrs)
      expect(obj.notes).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when start_date is set to nil' do
      expect {
        instance.start_date = nil
      }.to raise_error(ArgumentError, /start_date cannot be nil/)
    end

    it 'raises when category_id is set to nil' do
      expect {
        instance.category_id = nil
      }.to raise_error(ArgumentError, /category_id cannot be nil/)
    end

    it 'raises when amount is set to nil' do
      expect {
        instance.amount = nil
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UpsertBudgetRequestObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UpsertBudgetRequestObject.new(valid_attributes.merge(category_id: 99))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:start_date]).to eq(Date.new(2025, 3, 1))
      expect(hash[:category_id]).to eq(42)
      expect(hash[:currency]).to eq('usd')
    end
  end

  describe '.build_from_hash' do
    it 'raises because amount (complex type) is required but missing from simple hash' do
      json_hash = {
        start_date: '2025-03-01',
        category_id: 42,
        currency: 'usd'
      }
      expect {
        LunchMoney::UpsertBudgetRequestObject.build_from_hash(json_hash)
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end
  end
end
