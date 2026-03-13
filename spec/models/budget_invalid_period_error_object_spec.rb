require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::BudgetInvalidPeriodErrorObject do
  let(:valid_attributes) do
    {
      message: 'Invalid period',
      requested_start_date: Date.new(2025, 3, 15),
      previous_valid_start_date: nil,
      next_valid_start_date: nil,
      err_msg: 'Must align to budget period'
    }
  end

  let(:instance) { LunchMoney::BudgetInvalidPeriodErrorObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of BudgetInvalidPeriodErrorObject' do
      expect(instance).to be_instance_of(LunchMoney::BudgetInvalidPeriodErrorObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.message).to eq('Invalid period')
      expect(instance.requested_start_date).to eq(Date.new(2025, 3, 15))
      expect(instance.err_msg).to eq('Must align to budget period')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::BudgetInvalidPeriodErrorObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::BudgetInvalidPeriodErrorObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows previous_valid_start_date to be nil' do
      attrs = valid_attributes.merge(previous_valid_start_date: nil)
      obj = LunchMoney::BudgetInvalidPeriodErrorObject.new(attrs)
      expect(obj.previous_valid_start_date).to be_nil
    end

    it 'allows next_valid_start_date to be nil' do
      attrs = valid_attributes.merge(next_valid_start_date: nil)
      obj = LunchMoney::BudgetInvalidPeriodErrorObject.new(attrs)
      expect(obj.next_valid_start_date).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when message is set to nil' do
      expect {
        instance.message = nil
      }.to raise_error(ArgumentError, /message cannot be nil/)
    end

    it 'raises when requested_start_date is set to nil' do
      expect {
        instance.requested_start_date = nil
      }.to raise_error(ArgumentError, /requested_start_date cannot be nil/)
    end

    it 'raises when err_msg is set to nil' do
      expect {
        instance.err_msg = nil
      }.to raise_error(ArgumentError, /err_msg cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::BudgetInvalidPeriodErrorObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::BudgetInvalidPeriodErrorObject.new(valid_attributes.merge(message: 'Different'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:message]).to eq('Invalid period')
      expect(hash[:requested_start_date]).to eq(Date.new(2025, 3, 15))
      expect(hash[:errMsg]).to eq('Must align to budget period')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        message: 'Invalid period',
        requested_start_date: '2025-03-15',
        errMsg: 'Must align to budget period'
      }
      obj = LunchMoney::BudgetInvalidPeriodErrorObject.build_from_hash(json_hash)
      expect(obj.message).to eq('Invalid period')
      expect(obj.requested_start_date).to eq(Date.new(2025, 3, 15))
    end
  end
end
