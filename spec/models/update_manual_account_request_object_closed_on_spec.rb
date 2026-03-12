require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpdateManualAccountRequestObjectClosedOn do
  describe '.openapi_one_of' do
    it 'returns expected types' do
      expect(described_class.openapi_one_of).to eq([:'Date', :'Time'])
    end
  end

  describe '.build' do
    it 'returns a Date for a date string' do
      result = described_class.build('2025-12-31')
      expect(result).to be_a(Date)
      expect(result).to eq(Date.new(2025, 12, 31))
    end

    it 'returns a Date for a datetime string (Date.iso8601 matches first in oneOf)' do
      result = described_class.build('2025-12-31T23:59:59Z')
      expect(result).to be_a(Date)
    end

    it 'returns nil for nil' do
      expect(described_class.build(nil)).to be_nil
    end
  end
end
