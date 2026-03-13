require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::DeleteCategoryResponseWithDependencies do
  let(:valid_attributes) do
    {
      category_name: 'Old Category',
      dependents: []
    }
  end

  let(:instance) { LunchMoney::DeleteCategoryResponseWithDependencies.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of DeleteCategoryResponseWithDependencies' do
      expect(instance).to be_instance_of(LunchMoney::DeleteCategoryResponseWithDependencies)
    end

    it 'sets all attributes from hash' do
      expect(instance.category_name).to eq('Old Category')
      expect(instance.dependents).to eq([])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::DeleteCategoryResponseWithDependencies.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::DeleteCategoryResponseWithDependencies.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when category_name is set to nil' do
      expect {
        instance.category_name = nil
      }.to raise_error(ArgumentError, /category_name cannot be nil/)
    end

    it 'raises when dependents is set to nil' do
      expect {
        instance.dependents = nil
      }.to raise_error(ArgumentError, /dependents cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::DeleteCategoryResponseWithDependencies.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::DeleteCategoryResponseWithDependencies.new(valid_attributes.merge(category_name: 'Different'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:category_name]).to eq('Old Category')
      expect(hash[:dependents]).to eq([])
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      dependents = LunchMoney::DeleteCategoryResponseWithDependenciesDependents.new(
        budget: 0, category_rules: 0, transactions: 0, children: 0, recurring: 0, plaid_cats: 0
      )
      json_hash = {
        category_name: 'Old Category',
        dependents: dependents
      }
      obj = LunchMoney::DeleteCategoryResponseWithDependencies.new(json_hash)
      expect(obj.category_name).to eq('Old Category')
    end
  end
end
