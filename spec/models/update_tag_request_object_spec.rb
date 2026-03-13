require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpdateTagRequestObject do
  let(:valid_attributes) do
    {
      name: 'Updated Tag',
      description: nil,
      text_color: nil,
      background_color: nil,
      archived: false,
      id: 7,
      updated_at: Time.parse('2025-02-10T08:30:00Z'),
      created_at: Time.parse('2024-11-01T15:00:00Z'),
      archived_at: nil
    }
  end

  let(:instance) { LunchMoney::UpdateTagRequestObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UpdateTagRequestObject' do
      expect(instance).to be_instance_of(LunchMoney::UpdateTagRequestObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.name).to eq('Updated Tag')
      expect(instance.archived).to eq(false)
      expect(instance.id).to eq(7)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UpdateTagRequestObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::UpdateTagRequestObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = LunchMoney::UpdateTagRequestObject.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows text_color to be nil' do
      attrs = valid_attributes.merge(text_color: nil)
      obj = LunchMoney::UpdateTagRequestObject.new(attrs)
      expect(obj.text_color).to be_nil
    end

    it 'allows background_color to be nil' do
      attrs = valid_attributes.merge(background_color: nil)
      obj = LunchMoney::UpdateTagRequestObject.new(attrs)
      expect(obj.background_color).to be_nil
    end

    it 'allows archived_at to be nil' do
      attrs = valid_attributes.merge(archived_at: nil)
      obj = LunchMoney::UpdateTagRequestObject.new(attrs)
      expect(obj.archived_at).to be_nil
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UpdateTagRequestObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UpdateTagRequestObject.new(valid_attributes.merge(name: 'Different'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:name]).to eq('Updated Tag')
      expect(hash[:archived]).to eq(false)
      expect(hash[:id]).to eq(7)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        name: 'Updated Tag',
        archived: false,
        id: 7,
        updated_at: '2025-02-10T08:30:00Z',
        created_at: '2024-11-01T15:00:00Z'
      }
      obj = LunchMoney::UpdateTagRequestObject.build_from_hash(json_hash)
      expect(obj.name).to eq('Updated Tag')
      expect(obj.id).to eq(7)
    end
  end
end
