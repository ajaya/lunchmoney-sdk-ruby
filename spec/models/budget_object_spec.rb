require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::BudgetObject do
  let(:valid_attributes) do
    {
      id: 101,
      category_id: 42,
      amount: 500.0,
      currency: 'usd',
      start_date: Date.new(2025, 3, 1),
      next_start_date: Date.new(2025, 4, 1),
      notes: 'Monthly groceries budget',
      auto_budget_type: 'fixed',
      auto_budget_amount: 500.0,
      auto_budget_currency: 'usd',
      rollover_option: 'same category',
      granularity: 'month',
      quantity: 1,
      is_group: false,
      group_id: 10,
      created_at: Time.parse('2025-01-15T10:30:00Z'),
      updated_at: Time.parse('2025-02-20T14:00:00Z')
    }
  end

  let(:instance) { LunchMoney::BudgetObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of BudgetObject' do
      expect(instance).to be_instance_of(LunchMoney::BudgetObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(101)
      expect(instance.category_id).to eq(42)
      expect(instance.amount).to eq(500.0)
      expect(instance.currency).to eq('usd')
      expect(instance.start_date).to eq(Date.new(2025, 3, 1))
      expect(instance.granularity).to eq('month')
      expect(instance.quantity).to eq(1)
      expect(instance.is_group).to eq(false)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::BudgetObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::BudgetObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::BudgetObject.new(attrs)
      expect(obj.notes).to be_nil
    end

    it 'allows group_id to be nil' do
      attrs = valid_attributes.merge(group_id: nil)
      obj = LunchMoney::BudgetObject.new(attrs)
      expect(obj.group_id).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when id is set to nil' do
      expect {
        instance.id = nil
      }.to raise_error(ArgumentError, /id cannot be nil/)
    end

    it 'raises when category_id is set to nil' do
      expect {
        instance.category_id = nil
      }.to raise_error(ArgumentError, /category_id cannot be nil/)
    end

    it 'raises when quantity is set to nil' do
      expect {
        instance.quantity = nil
      }.to raise_error(ArgumentError, /quantity cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::BudgetObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::BudgetObject.new(valid_attributes.merge(amount: 999.0))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(101)
      expect(hash[:category_id]).to eq(42)
      expect(hash[:amount]).to eq(500.0)
      expect(hash[:granularity]).to eq('month')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 101,
        category_id: 42,
        amount: 500.0,
        currency: 'usd',
        start_date: '2025-03-01',
        next_start_date: '2025-04-01',
        auto_budget_type: 'fixed',
        granularity: 'month',
        quantity: 1,
        is_group: false,
        created_at: '2025-01-15T10:30:00Z',
        updated_at: '2025-02-20T14:00:00Z'
      }
      obj = LunchMoney::BudgetObject.build_from_hash(json_hash)
      expect(obj.id).to eq(101)
      expect(obj.category_id).to eq(42)
    end
  end
end
