require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::TagObject do
  let(:valid_attributes) do
    {
      id: 7,
      name: 'vacation',
      description: 'Travel and vacation expenses',
      text_color: '#FFFFFF',
      background_color: '#3366CC',
      updated_at: Time.parse('2025-02-10T08:30:00Z'),
      created_at: Time.parse('2024-11-01T15:00:00Z'),
      archived: false,
      archived_at: nil
    }
  end

  let(:instance) { LunchMoney::TagObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of TagObject' do
      expect(instance).to be_instance_of(LunchMoney::TagObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.id).to eq(7)
      expect(instance.name).to eq('vacation')
      expect(instance.description).to eq('Travel and vacation expenses')
      expect(instance.text_color).to eq('#FFFFFF')
      expect(instance.background_color).to eq('#3366CC')
      expect(instance.archived).to eq(false)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::TagObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::TagObject.new([1, 2])
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = LunchMoney::TagObject.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows archived_at to be nil' do
      attrs = valid_attributes.merge(archived_at: nil)
      obj = LunchMoney::TagObject.new(attrs)
      expect(obj.archived_at).to be_nil
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

    it 'raises when archived is set to nil' do
      expect {
        instance.archived = nil
      }.to raise_error(ArgumentError, /archived cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::TagObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::TagObject.new(valid_attributes.merge(name: 'food'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:id]).to eq(7)
      expect(hash[:name]).to eq('vacation')
      expect(hash[:archived]).to eq(false)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        id: 7,
        name: 'vacation',
        updated_at: '2025-02-10T08:30:00Z',
        created_at: '2024-11-01T15:00:00Z',
        archived: false
      }
      obj = LunchMoney::TagObject.build_from_hash(json_hash)
      expect(obj.id).to eq(7)
      expect(obj.name).to eq('vacation')
    end
  end
end
