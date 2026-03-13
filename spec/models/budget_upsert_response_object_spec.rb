require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::BudgetUpsertResponseObject do
  let(:valid_attributes) do
    {
      category_id: 42,
      start_date: Date.new(2025, 3, 1),
      amount: '500.00',
      currency: 'usd',
      to_base: 500.0,
      notes: nil
    }
  end

  let(:instance) { LunchMoney::BudgetUpsertResponseObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of BudgetUpsertResponseObject' do
      expect(instance).to be_instance_of(LunchMoney::BudgetUpsertResponseObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.category_id).to eq(42)
      expect(instance.start_date).to eq(Date.new(2025, 3, 1))
      expect(instance.amount).to eq('500.00')
      expect(instance.currency).to eq('usd')
      expect(instance.to_base).to eq(500.0)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::BudgetUpsertResponseObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::BudgetUpsertResponseObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::BudgetUpsertResponseObject.new(attrs)
      expect(obj.notes).to be_nil
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::BudgetUpsertResponseObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::BudgetUpsertResponseObject.new(valid_attributes.merge(amount: '1000.00'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:category_id]).to eq(42)
      expect(hash[:amount]).to eq('500.00')
      expect(hash[:currency]).to eq('usd')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        category_id: 42,
        start_date: '2025-03-01',
        amount: '500.00',
        currency: 'usd',
        to_base: 500.0
      }
      obj = LunchMoney::BudgetUpsertResponseObject.build_from_hash(json_hash)
      expect(obj.category_id).to eq(42)
      expect(obj.amount).to eq('500.00')
    end
  end
end
