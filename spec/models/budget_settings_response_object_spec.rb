require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::BudgetSettingsResponseObject do
  let(:valid_attributes) do
    {
      budget_period_granularity: 'month',
      budget_period_quantity: 1.0,
      budget_period_anchor_date: Date.new(2025, 1, 1),
      budget_hide_no_activity: false,
      budget_use_last_day_of_month: false,
      budget_income_option: 'max',
      budget_rollover_left_to_budget: false
    }
  end

  let(:instance) { LunchMoney::BudgetSettingsResponseObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of BudgetSettingsResponseObject' do
      expect(instance).to be_instance_of(LunchMoney::BudgetSettingsResponseObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.budget_period_granularity).to eq('month')
      expect(instance.budget_period_quantity).to eq(1.0)
      expect(instance.budget_period_anchor_date).to eq(Date.new(2025, 1, 1))
      expect(instance.budget_hide_no_activity).to eq(false)
      expect(instance.budget_use_last_day_of_month).to eq(false)
      expect(instance.budget_income_option).to eq('max')
      expect(instance.budget_rollover_left_to_budget).to eq(false)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::BudgetSettingsResponseObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::BudgetSettingsResponseObject.new(42)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'enum validation' do
    it 'accepts valid budget_period_granularity values' do
      %w[day week month year].each do |value|
        instance.budget_period_granularity = value
        expect(instance.budget_period_granularity).to eq(value)
      end
      instance.budget_period_granularity = 'twice a month'
      expect(instance.budget_period_granularity).to eq('twice a month')
    end

    it 'rejects invalid budget_period_granularity values' do
      expect {
        instance.budget_period_granularity = 'invalid'
      }.to raise_error(ArgumentError, /invalid value for "budget_period_granularity"/)
    end

    it 'accepts valid budget_income_option values' do
      %w[max budgeted activity].each do |value|
        instance.budget_income_option = value
        expect(instance.budget_income_option).to eq(value)
      end
    end

    it 'rejects invalid budget_income_option values' do
      expect {
        instance.budget_income_option = 'invalid'
      }.to raise_error(ArgumentError, /invalid value for "budget_income_option"/)
    end
  end

  describe 'required attributes' do
    it 'raises when budget_period_quantity is set to nil' do
      expect {
        instance.budget_period_quantity = nil
      }.to raise_error(ArgumentError, /budget_period_quantity cannot be nil/)
    end

    it 'raises when budget_period_anchor_date is set to nil' do
      expect {
        instance.budget_period_anchor_date = nil
      }.to raise_error(ArgumentError, /budget_period_anchor_date cannot be nil/)
    end

    it 'raises when budget_hide_no_activity is set to nil' do
      expect {
        instance.budget_hide_no_activity = nil
      }.to raise_error(ArgumentError, /budget_hide_no_activity cannot be nil/)
    end

    it 'raises when budget_use_last_day_of_month is set to nil' do
      expect {
        instance.budget_use_last_day_of_month = nil
      }.to raise_error(ArgumentError, /budget_use_last_day_of_month cannot be nil/)
    end

    it 'raises when budget_rollover_left_to_budget is set to nil' do
      expect {
        instance.budget_rollover_left_to_budget = nil
      }.to raise_error(ArgumentError, /budget_rollover_left_to_budget cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::BudgetSettingsResponseObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::BudgetSettingsResponseObject.new(valid_attributes.merge(budget_period_granularity: 'week'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:budget_period_granularity]).to eq('month')
      expect(hash[:budget_period_quantity]).to eq(1.0)
      expect(hash[:budget_income_option]).to eq('max')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        budget_period_granularity: 'month',
        budget_period_quantity: 1.0,
        budget_period_anchor_date: '2025-01-01',
        budget_hide_no_activity: false,
        budget_use_last_day_of_month: false,
        budget_income_option: 'max',
        budget_rollover_left_to_budget: false
      }
      obj = LunchMoney::BudgetSettingsResponseObject.build_from_hash(json_hash)
      expect(obj.budget_period_granularity).to eq('month')
      expect(obj.budget_income_option).to eq('max')
    end
  end
end
