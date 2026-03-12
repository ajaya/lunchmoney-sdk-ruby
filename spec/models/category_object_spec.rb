require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::CategoryObject do
  let(:valid_attributes) do
    {
      id: 55,
      name: 'Groceries',
      description: 'Weekly grocery shopping',
      is_income: false,
      exclude_from_budget: false,
      exclude_from_totals: false,
      updated_at: Time.parse('2025-03-01T12:00:00Z'),
      created_at: Time.parse('2024-06-15T09:00:00Z'),
      group_id: 12,
      is_group: false,
      children: [],
      archived: false,
      archived_at: nil,
      order: 3,
      collapsed: false
    }
  end

  let(:instance) { LunchMoney::CategoryObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of CategoryObject' do
      expect(instance).to be_instance_of(LunchMoney::CategoryObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(55)
      expect(instance.name).to eq('Groceries')
      expect(instance.description).to eq('Weekly grocery shopping')
      expect(instance.is_income).to eq(false)
      expect(instance.exclude_from_budget).to eq(false)
      expect(instance.is_group).to eq(false)
      expect(instance.archived).to eq(false)
      expect(instance.collapsed).to eq(false)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::CategoryObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::CategoryObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = LunchMoney::CategoryObject.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows group_id to be nil' do
      attrs = valid_attributes.merge(group_id: nil)
      obj = LunchMoney::CategoryObject.new(attrs)
      expect(obj.group_id).to be_nil
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

    it 'raises when collapsed is set to nil' do
      expect {
        instance.collapsed = nil
      }.to raise_error(ArgumentError, /collapsed cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::CategoryObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::CategoryObject.new(valid_attributes.merge(name: 'Dining'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(55)
      expect(hash[:name]).to eq('Groceries')
      expect(hash[:is_income]).to eq(false)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 55,
        name: 'Groceries',
        is_income: false,
        exclude_from_budget: false,
        exclude_from_totals: false,
        updated_at: '2025-03-01T12:00:00Z',
        created_at: '2024-06-15T09:00:00Z',
        is_group: false,
        children: [],
        archived: false,
        collapsed: false
      }
      obj = LunchMoney::CategoryObject.build_from_hash(json_hash)
      expect(obj.id).to eq(55)
      expect(obj.name).to eq('Groceries')
    end
  end
end
