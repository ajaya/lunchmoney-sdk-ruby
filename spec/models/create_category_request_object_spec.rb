require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::CreateCategoryRequestObject do
  let(:valid_attributes) do
    {
      name: 'Dining'
    }
  end

  let(:instance) { LunchMoney::CreateCategoryRequestObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of CreateCategoryRequestObject' do
      expect(instance).to be_instance_of(LunchMoney::CreateCategoryRequestObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.name).to eq('Dining')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::CreateCategoryRequestObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::CreateCategoryRequestObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = LunchMoney::CreateCategoryRequestObject.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows group_id to be nil' do
      attrs = valid_attributes.merge(group_id: nil)
      obj = LunchMoney::CreateCategoryRequestObject.new(attrs)
      expect(obj.group_id).to be_nil
    end

    it 'allows order to be nil' do
      attrs = valid_attributes.merge(order: nil)
      obj = LunchMoney::CreateCategoryRequestObject.new(attrs)
      expect(obj.order).to be_nil
    end

    it 'allows collapsed to be nil' do
      attrs = valid_attributes.merge(collapsed: nil)
      obj = LunchMoney::CreateCategoryRequestObject.new(attrs)
      expect(obj.collapsed).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when name is set to nil' do
      expect {
        instance.name = nil
      }.to raise_error(ArgumentError, /name cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::CreateCategoryRequestObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::CreateCategoryRequestObject.new(valid_attributes.merge(name: 'Travel'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:name]).to eq('Dining')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        name: 'Dining'
      }
      obj = LunchMoney::CreateCategoryRequestObject.build_from_hash(json_hash)
      expect(obj.name).to eq('Dining')
    end
  end
end
