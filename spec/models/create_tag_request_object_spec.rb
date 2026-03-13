require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::CreateTagRequestObject do
  let(:valid_attributes) do
    {
      name: 'Travel'
    }
  end

  let(:instance) { LunchMoney::CreateTagRequestObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of CreateTagRequestObject' do
      expect(instance).to be_instance_of(LunchMoney::CreateTagRequestObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.name).to eq('Travel')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::CreateTagRequestObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::CreateTagRequestObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = LunchMoney::CreateTagRequestObject.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows text_color to be nil' do
      attrs = valid_attributes.merge(text_color: nil)
      obj = LunchMoney::CreateTagRequestObject.new(attrs)
      expect(obj.text_color).to be_nil
    end

    it 'allows background_color to be nil' do
      attrs = valid_attributes.merge(background_color: nil)
      obj = LunchMoney::CreateTagRequestObject.new(attrs)
      expect(obj.background_color).to be_nil
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
      other = LunchMoney::CreateTagRequestObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::CreateTagRequestObject.new(valid_attributes.merge(name: 'Food'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:name]).to eq('Travel')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        name: 'Travel'
      }
      obj = LunchMoney::CreateTagRequestObject.build_from_hash(json_hash)
      expect(obj.name).to eq('Travel')
    end
  end
end
