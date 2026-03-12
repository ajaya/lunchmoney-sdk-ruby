require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UserObject do
  let(:valid_attributes) do
    {
      name: 'Test User',
      email: 'test@example.com',
      id: 123,
      account_id: 456,
      budget_name: 'My Budget',
      primary_currency: 'usd',
      api_key_label: 'dev-key'
    }
  end

  let(:instance) { LunchMoney::UserObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UserObject' do
      expect(instance).to be_instance_of(LunchMoney::UserObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.name).to eq('Test User')
      expect(instance.email).to eq('test@example.com')
      expect(instance.id).to eq(123)
      expect(instance.account_id).to eq(456)
      expect(instance.budget_name).to eq('My Budget')
      expect(instance.primary_currency).to eq('usd')
      expect(instance.api_key_label).to eq('dev-key')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UserObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::UserObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows api_key_label to be nil' do
      attrs = valid_attributes.merge(api_key_label: nil)
      obj = LunchMoney::UserObject.new(attrs)
      expect(obj.api_key_label).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when name is set to nil' do
      expect {
        instance.name = nil
      }.to raise_error(ArgumentError, /name cannot be nil/)
    end

    it 'raises when email is set to nil' do
      expect {
        instance.email = nil
      }.to raise_error(ArgumentError, /email cannot be nil/)
    end

    it 'raises when id is set to nil' do
      expect {
        instance.id = nil
      }.to raise_error(ArgumentError, /id cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UserObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UserObject.new(valid_attributes.merge(name: 'Other'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:name]).to eq('Test User')
      expect(hash[:email]).to eq('test@example.com')
      expect(hash[:id]).to eq(123)
      expect(hash[:account_id]).to eq(456)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::UserObject.build_from_hash(valid_attributes)
      expect(obj.name).to eq('Test User')
      expect(obj.id).to eq(123)
    end
  end
end
