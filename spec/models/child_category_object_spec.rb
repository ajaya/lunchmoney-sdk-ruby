require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::ChildCategoryObject do
  let(:valid_attributes) do
    {
      id: 10,
      name: 'Groceries',
      description: 'Weekly',
      is_income: false,
      exclude_from_budget: false,
      exclude_from_totals: false,
      updated_at: Time.parse('2025-03-01T12:00:00Z'),
      created_at: Time.parse('2024-06-15T09:00:00Z'),
      group_id: 5,
      is_group: false,
      archived: false,
      archived_at: nil,
      order: 2,
      collapsed: false
    }
  end

  let(:instance) { LunchMoney::ChildCategoryObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of ChildCategoryObject' do
      expect(instance).to be_instance_of(LunchMoney::ChildCategoryObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(10)
      expect(instance.name).to eq('Groceries')
      expect(instance.description).to eq('Weekly')
      expect(instance.is_income).to eq(false)
      expect(instance.exclude_from_budget).to eq(false)
      expect(instance.exclude_from_totals).to eq(false)
      expect(instance.group_id).to eq(5)
      expect(instance.is_group).to eq(false)
      expect(instance.archived).to eq(false)
      expect(instance.order).to eq(2)
      expect(instance.collapsed).to eq(false)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::ChildCategoryObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::ChildCategoryObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = LunchMoney::ChildCategoryObject.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows group_id to be nil' do
      attrs = valid_attributes.merge(group_id: nil)
      obj = LunchMoney::ChildCategoryObject.new(attrs)
      expect(obj.group_id).to be_nil
    end

    it 'allows archived_at to be nil' do
      attrs = valid_attributes.merge(archived_at: nil)
      obj = LunchMoney::ChildCategoryObject.new(attrs)
      expect(obj.archived_at).to be_nil
    end

    it 'allows order to be nil' do
      attrs = valid_attributes.merge(order: nil)
      obj = LunchMoney::ChildCategoryObject.new(attrs)
      expect(obj.order).to be_nil
    end

    it 'allows collapsed to be nil' do
      attrs = valid_attributes.merge(collapsed: nil)
      obj = LunchMoney::ChildCategoryObject.new(attrs)
      expect(obj.collapsed).to be_nil
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

    it 'raises when is_income is set to nil' do
      expect {
        instance.is_income = nil
      }.to raise_error(ArgumentError, /is_income cannot be nil/)
    end

    it 'raises when exclude_from_budget is set to nil' do
      expect {
        instance.exclude_from_budget = nil
      }.to raise_error(ArgumentError, /exclude_from_budget cannot be nil/)
    end

    it 'raises when exclude_from_totals is set to nil' do
      expect {
        instance.exclude_from_totals = nil
      }.to raise_error(ArgumentError, /exclude_from_totals cannot be nil/)
    end

    it 'raises when updated_at is set to nil' do
      expect {
        instance.updated_at = nil
      }.to raise_error(ArgumentError, /updated_at cannot be nil/)
    end

    it 'raises when created_at is set to nil' do
      expect {
        instance.created_at = nil
      }.to raise_error(ArgumentError, /created_at cannot be nil/)
    end

    it 'raises when is_group is set to nil' do
      expect {
        instance.is_group = nil
      }.to raise_error(ArgumentError, /is_group cannot be nil/)
    end

    it 'raises when archived is set to nil' do
      expect {
        instance.archived = nil
      }.to raise_error(ArgumentError, /archived cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::ChildCategoryObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::ChildCategoryObject.new(valid_attributes.merge(name: 'Dining'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(10)
      expect(hash[:name]).to eq('Groceries')
      expect(hash[:is_income]).to eq(false)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 10,
        name: 'Groceries',
        is_income: false,
        exclude_from_budget: false,
        exclude_from_totals: false,
        updated_at: '2025-03-01T12:00:00Z',
        created_at: '2024-06-15T09:00:00Z',
        is_group: false,
        archived: false
      }
      obj = LunchMoney::ChildCategoryObject.build_from_hash(json_hash)
      expect(obj.id).to eq(10)
      expect(obj.name).to eq('Groceries')
    end
  end
end
