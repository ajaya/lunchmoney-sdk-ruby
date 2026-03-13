require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::SplitTransactionObject do
  let(:valid_attributes) do
    {
      amount: { amount: '20.00', currency: 'usd' },
      payee: 'Split Payee',
      date: Date.new(2025, 3, 5),
      category_id: 10,
      tag_ids: [1],
      notes: 'Split note'
    }
  end

  let(:instance) { LunchMoney::SplitTransactionObject.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of SplitTransactionObject' do
      expect(instance).to be_instance_of(LunchMoney::SplitTransactionObject)
    end

    it 'sets all attributes from hash' do
      expect(instance.amount).to eq({ amount: '20.00', currency: 'usd' })
      expect(instance.payee).to eq('Split Payee')
      expect(instance.date).to eq(Date.new(2025, 3, 5))
      expect(instance.category_id).to eq(10)
      expect(instance.tag_ids).to eq([1])
      expect(instance.notes).to eq('Split note')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::SplitTransactionObject.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::SplitTransactionObject.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when amount is set to nil' do
      expect {
        instance.amount = nil
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::SplitTransactionObject.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::SplitTransactionObject.new(valid_attributes.merge(payee: 'Other'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:payee]).to eq('Split Payee')
      expect(hash[:date]).to eq(Date.new(2025, 3, 5))
      expect(hash[:notes]).to eq('Split note')
    end
  end

  describe '.build_from_hash' do
    it 'raises because amount (complex type) is required but missing' do
      json_hash = {
        payee: 'Split Payee',
        date: '2025-03-05'
      }
      expect {
        LunchMoney::SplitTransactionObject.build_from_hash(json_hash)
      }.to raise_error(ArgumentError, /amount cannot be nil/)
    end
  end
end
