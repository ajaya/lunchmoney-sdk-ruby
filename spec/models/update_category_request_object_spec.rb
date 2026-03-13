require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpdateCategoryRequestObject do
  let(:valid_attributes) do
    {
      name: 'Updated Category',
      description: nil,
      is_income: false,
      exclude_from_budget: false,
      exclude_from_totals: false,
      archived: false,
      group_id: nil,
      is_group: nil,
      children: [],
      order: nil,
      collapsed: nil,
      id: 55,
      archived_at: nil,
      updated_at: Time.parse('2025-03-01T12:00:00Z'),
      created_at: Time.parse('2024-06-15T09:00:00Z')
    }
  end

  let(:instance) { LunchMoney::UpdateCategoryRequestObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UpdateCategoryRequestObject' do
      expect(instance).to be_instance_of(LunchMoney::UpdateCategoryRequestObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.name).to eq('Updated Category')
      expect(instance.is_income).to eq(false)
      expect(instance.exclude_from_budget).to eq(false)
      expect(instance.archived).to eq(false)
      expect(instance.id).to eq(55)
      expect(instance.children).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UpdateCategoryRequestObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::UpdateCategoryRequestObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = LunchMoney::UpdateCategoryRequestObject.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows group_id to be nil' do
      attrs = valid_attributes.merge(group_id: nil)
      obj = LunchMoney::UpdateCategoryRequestObject.new(attrs)
      expect(obj.group_id).to be_nil
    end

    it 'allows is_group to be nil' do
      attrs = valid_attributes.merge(is_group: nil)
      obj = LunchMoney::UpdateCategoryRequestObject.new(attrs)
      expect(obj.is_group).to be_nil
    end

    it 'allows order to be nil' do
      attrs = valid_attributes.merge(order: nil)
      obj = LunchMoney::UpdateCategoryRequestObject.new(attrs)
      expect(obj.order).to be_nil
    end

    it 'allows collapsed to be nil' do
      attrs = valid_attributes.merge(collapsed: nil)
      obj = LunchMoney::UpdateCategoryRequestObject.new(attrs)
      expect(obj.collapsed).to be_nil
    end

    it 'allows archived_at to be nil' do
      attrs = valid_attributes.merge(archived_at: nil)
      obj = LunchMoney::UpdateCategoryRequestObject.new(attrs)
      expect(obj.archived_at).to be_nil
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UpdateCategoryRequestObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UpdateCategoryRequestObject.new(valid_attributes.merge(name: 'Different'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:name]).to eq('Updated Category')
      expect(hash[:is_income]).to eq(false)
      expect(hash[:id]).to eq(55)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        name: 'Updated Category',
        is_income: false,
        exclude_from_budget: false,
        exclude_from_totals: false,
        archived: false,
        children: [],
        id: 55,
        updated_at: '2025-03-01T12:00:00Z',
        created_at: '2024-06-15T09:00:00Z'
      }
      obj = LunchMoney::UpdateCategoryRequestObject.build_from_hash(json_hash)
      expect(obj.name).to eq('Updated Category')
      expect(obj.id).to eq(55)
    end
  end
end
