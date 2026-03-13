require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::DeleteTagResponseWithDependencies do
  let(:valid_attributes) do
    {
      tag_name: 'Old Tag',
      dependents: []
    }
  end

  let(:instance) { LunchMoney::DeleteTagResponseWithDependencies.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of DeleteTagResponseWithDependencies' do
      expect(instance).to be_instance_of(LunchMoney::DeleteTagResponseWithDependencies)
    end

    it 'sets all attributes from hash' do
      expect(instance.tag_name).to eq('Old Tag')
      expect(instance.dependents).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::DeleteTagResponseWithDependencies.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::DeleteTagResponseWithDependencies.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when tag_name is set to nil' do
      expect {
        instance.tag_name = nil
      }.to raise_error(ArgumentError, /tag_name cannot be nil/)
    end

    it 'raises when dependents is set to nil' do
      expect {
        instance.dependents = nil
      }.to raise_error(ArgumentError, /dependents cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::DeleteTagResponseWithDependencies.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::DeleteTagResponseWithDependencies.new(valid_attributes.merge(tag_name: 'Different'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:tag_name]).to eq('Old Tag')
      expect(hash[:dependents]).to eq([])
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      dependents = LunchMoney::DeleteTagResponseWithDependenciesDependents.new(transactions: 0, rules: 0)
      json_hash = {
        tag_name: 'Old Tag',
        dependents: dependents
      }
      obj = LunchMoney::DeleteTagResponseWithDependencies.new(json_hash)
      expect(obj.tag_name).to eq('Old Tag')
    end
  end
end
