require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryCategoryOccurrenceObject do
  let(:valid_attributes) do
    {
      in_range: true,
      start_date: Date.new(2025, 3, 1),
      end_date: Date.new(2025, 3, 31),
      other_activity: 100.0,
      recurring_activity: 50.0,
      budgeted: nil,
      budgeted_amount: nil,
      budgeted_currency: nil,
      notes: nil
    }
  end

  let(:instance) { LunchMoney::SummaryCategoryOccurrenceObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryCategoryOccurrenceObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryCategoryOccurrenceObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.in_range).to eq(true)
      expect(instance.start_date).to eq(Date.new(2025, 3, 1))
      expect(instance.end_date).to eq(Date.new(2025, 3, 31))
      expect(instance.other_activity).to eq(100.0)
      expect(instance.recurring_activity).to eq(50.0)
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryCategoryOccurrenceObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryCategoryOccurrenceObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows budgeted to be nil' do
      attrs = valid_attributes.merge(budgeted: nil)
      obj = LunchMoney::SummaryCategoryOccurrenceObject.new(attrs)
      expect(obj.budgeted).to be_nil
    end

    it 'allows budgeted_amount to be nil' do
      attrs = valid_attributes.merge(budgeted_amount: nil)
      obj = LunchMoney::SummaryCategoryOccurrenceObject.new(attrs)
      expect(obj.budgeted_amount).to be_nil
    end

    it 'allows budgeted_currency to be nil' do
      attrs = valid_attributes.merge(budgeted_currency: nil)
      obj = LunchMoney::SummaryCategoryOccurrenceObject.new(attrs)
      expect(obj.budgeted_currency).to be_nil
    end

    it 'allows notes to be nil' do
      attrs = valid_attributes.merge(notes: nil)
      obj = LunchMoney::SummaryCategoryOccurrenceObject.new(attrs)
      expect(obj.notes).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when in_range is set to nil' do
      expect {
        instance.in_range = nil
      }.to raise_error(ArgumentError, /in_range cannot be nil/)
    end

    it 'raises when start_date is set to nil' do
      expect {
        instance.start_date = nil
      }.to raise_error(ArgumentError, /start_date cannot be nil/)
    end

    it 'raises when end_date is set to nil' do
      expect {
        instance.end_date = nil
      }.to raise_error(ArgumentError, /end_date cannot be nil/)
    end

    it 'raises when other_activity is set to nil' do
      expect {
        instance.other_activity = nil
      }.to raise_error(ArgumentError, /other_activity cannot be nil/)
    end

    it 'raises when recurring_activity is set to nil' do
      expect {
        instance.recurring_activity = nil
      }.to raise_error(ArgumentError, /recurring_activity cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryCategoryOccurrenceObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryCategoryOccurrenceObject.new(valid_attributes.merge(other_activity: 999.0))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:in_range]).to eq(true)
      expect(hash[:start_date]).to eq(Date.new(2025, 3, 1))
      expect(hash[:other_activity]).to eq(100.0)
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        in_range: true,
        start_date: '2025-03-01',
        end_date: '2025-03-31',
        other_activity: 100.0,
        recurring_activity: 50.0
      }
      obj = LunchMoney::SummaryCategoryOccurrenceObject.build_from_hash(json_hash)
      expect(obj.in_range).to eq(true)
      expect(obj.start_date).to eq(Date.new(2025, 3, 1))
    end
  end
end
