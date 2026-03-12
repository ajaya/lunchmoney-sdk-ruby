require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpsertBudget400Response do
  describe '.openapi_one_of' do
    it 'returns expected types' do
      expect(described_class.openapi_one_of).to eq([:'BudgetInvalidPeriodErrorObject', :'ErrorResponseObject'])
    end
  end

  describe '.build' do
    it 'builds an ErrorResponseObject from matching hash' do
      data = { message: 'Bad request', errors: [] }
      result = described_class.build(data)
      expect(result).to be_a(LunchMoney::ErrorResponseObject)
    end

    it 'returns nil for nil' do
      expect(described_class.build(nil)).to be_nil
    end
  end
end
