require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::CreateCategoryRequestObjectChildrenInner do
  describe '.openapi_one_of' do
    it 'returns expected types' do
      expect(described_class.openapi_one_of).to eq([:'CategoryObject', :'Integer', :'String'])
    end
  end

  describe '.build' do
    it 'returns an Integer for integer data' do
      result = described_class.build(42)
      expect(result).to be_an(Integer)
      expect(result).to eq(42)
    end

    it 'returns a String for string data' do
      result = described_class.build('Groceries')
      expect(result).to be_a(String)
      expect(result).to eq('Groceries')
    end

    it 'returns nil for nil' do
      expect(described_class.build(nil)).to be_nil
    end
  end
end
