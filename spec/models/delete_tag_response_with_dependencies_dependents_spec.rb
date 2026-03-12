require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::DeleteTagResponseWithDependenciesDependents do
  let(:valid_attributes) do
    {
      rules: 3,
      transactions: 12
    }
  end

  let(:instance) { LunchMoney::DeleteTagResponseWithDependenciesDependents.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of DeleteTagResponseWithDependenciesDependents' do
      expect(instance).to be_instance_of(LunchMoney::DeleteTagResponseWithDependenciesDependents)
    end

    it 'sets all attributes from hash' do
      expect(instance.rules).to eq(3)
      expect(instance.transactions).to eq(12)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::DeleteTagResponseWithDependenciesDependents.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::DeleteTagResponseWithDependenciesDependents.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when rules is set to nil' do
      expect {
        instance.rules = nil
      }.to raise_error(ArgumentError, /rules cannot be nil/)
    end

    it 'raises when transactions is set to nil' do
      expect {
        instance.transactions = nil
      }.to raise_error(ArgumentError, /transactions cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::DeleteTagResponseWithDependenciesDependents.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::DeleteTagResponseWithDependenciesDependents.new(valid_attributes.merge(rules: 99))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:rules]).to eq(3)
      expect(hash[:transactions]).to eq(12)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::DeleteTagResponseWithDependenciesDependents.build_from_hash(valid_attributes)
      expect(obj.rules).to eq(3)
      expect(obj.transactions).to eq(12)
    end
  end
end
