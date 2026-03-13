require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SummaryRecurringTransactionObject do
  let(:valid_attributes) do
    {
      date: Date.new(2025, 3, 5),
      category_id: 42,
      payee: 'Netflix',
      to_base: 15.99,
      amount: '15.9900',
      currency: 'usd'
    }
  end

  let(:instance) { LunchMoney::SummaryRecurringTransactionObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SummaryRecurringTransactionObject' do
      expect(instance).to be_instance_of(LunchMoney::SummaryRecurringTransactionObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.date).to eq(Date.new(2025, 3, 5))
      expect(instance.category_id).to eq(42)
      expect(instance.payee).to eq('Netflix')
      expect(instance.to_base).to eq(15.99)
      expect(instance.amount).to eq('15.9900')
      expect(instance.currency).to eq('usd')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SummaryRecurringTransactionObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SummaryRecurringTransactionObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when date is set to nil' do
      expect {
        instance.date = nil
      }.to raise_error(ArgumentError, /date cannot be nil/)
    end

    it 'raises when category_id is set to nil' do
      expect {
        instance.category_id = nil
      }.to raise_error(ArgumentError, /category_id cannot be nil/)
    end

    it 'raises when payee is set to nil' do
      expect {
        instance.payee = nil
      }.to raise_error(ArgumentError, /payee cannot be nil/)
    end

    it 'raises when to_base is set to nil' do
      expect {
        instance.to_base = nil
      }.to raise_error(ArgumentError, /to_base cannot be nil/)
    end

    it 'raises when amount is set to nil' do
      expect {
        instance.amount = nil
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end

    it 'raises when currency is set to nil' do
      expect {
        instance.currency = nil
      }.to raise_error(ArgumentError, /currency cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SummaryRecurringTransactionObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SummaryRecurringTransactionObject.new(valid_attributes.merge(payee: 'Spotify'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:date]).to eq(Date.new(2025, 3, 5))
      expect(hash[:payee]).to eq('Netflix')
      expect(hash[:amount]).to eq('15.9900')
      expect(hash[:currency]).to eq('usd')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with string values' do
      json_hash = {
        date: '2025-03-05',
        category_id: 42,
        payee: 'Netflix',
        to_base: 15.99,
        amount: '15.9900',
        currency: 'usd'
      }
      obj = LunchMoney::SummaryRecurringTransactionObject.build_from_hash(json_hash)
      expect(obj.date).to eq(Date.new(2025, 3, 5))
      expect(obj.payee).to eq('Netflix')
    end
  end
end
