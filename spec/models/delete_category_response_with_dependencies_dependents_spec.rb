require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::DeleteCategoryResponseWithDependenciesDependents do
  let(:valid_attributes) do
    {
      budget: 2,
      category_rules: 5,
      transactions: 47,
      children: 3,
      recurring: 1,
      plaid_cats: 0
    }
  end

  let(:instance) { LunchMoney::DeleteCategoryResponseWithDependenciesDependents.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of DeleteCategoryResponseWithDependenciesDependents' do
      expect(instance).to be_instance_of(LunchMoney::DeleteCategoryResponseWithDependenciesDependents)
    end

    it 'sets all attributes from hash' do
      expect(instance.budget).to eq(2)
      expect(instance.category_rules).to eq(5)
      expect(instance.transactions).to eq(47)
      expect(instance.children).to eq(3)
      expect(instance.recurring).to eq(1)
      expect(instance.plaid_cats).to eq(0)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::DeleteCategoryResponseWithDependenciesDependents.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::DeleteCategoryResponseWithDependenciesDependents.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when budget is set to nil' do
      expect {
        instance.budget = nil
      }.to raise_error(ArgumentError, /budget cannot be nil/)
    end

    it 'raises when transactions is set to nil' do
      expect {
        instance.transactions = nil
      }.to raise_error(ArgumentError, /transactions cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::DeleteCategoryResponseWithDependenciesDependents.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::DeleteCategoryResponseWithDependenciesDependents.new(valid_attributes.merge(budget: 99))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:budget]).to eq(2)
      expect(hash[:category_rules]).to eq(5)
      expect(hash[:transactions]).to eq(47)
      expect(hash[:children]).to eq(3)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::DeleteCategoryResponseWithDependenciesDependents.build_from_hash(valid_attributes)
      expect(obj.budget).to eq(2)
      expect(obj.plaid_cats).to eq(0)
    end
  end
end
