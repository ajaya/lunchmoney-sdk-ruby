require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::InsertTransactionObjectAmount do
  describe '.openapi_one_of' do
    it 'returns expected types' do
      expect(described_class.openapi_one_of).to eq([:'Float', :'String'])
    end
  end

  describe '.build' do
    it 'returns a Float for float data' do
      result = described_class.build(25.99)
      expect(result).to be_a(Float)
      expect(result).to eq(25.99)
    end

    it 'returns a String for string data' do
      result = described_class.build('25.99')
      expect(result).to be_a(String)
      expect(result).to eq('25.99')
    end

    it 'returns nil for nil' do
      expect(described_class.build(nil)).to be_nil
    end
  end
end
