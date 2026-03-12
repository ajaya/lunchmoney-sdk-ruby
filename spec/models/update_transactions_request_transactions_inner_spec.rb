require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::UpdateTransactionsRequestTransactionsInner do
  let(:valid_attributes) do
    {
      id: 12345,
      payee: 'Coffee Shop',
      notes: 'Morning latte',
      status: 'reviewed'
    }
  end

  let(:instance) { LunchMoney::UpdateTransactionsRequestTransactionsInner.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of UpdateTransactionsRequestTransactionsInner' do
      expect(instance).to be_instance_of(LunchMoney::UpdateTransactionsRequestTransactionsInner)
    end

    it 'sets attributes from hash' do
      expect(instance.id).to eq(12345)
      expect(instance.payee).to eq('Coffee Shop')
      expect(instance.notes).to eq('Morning latte')
      expect(instance.status).to eq('reviewed')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::UpdateTransactionsRequestTransactionsInner.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end
  end

  describe 'required attributes' do
    it 'raises when id is set to nil' do
      expect {
        instance.id = nil
      }.to raise_error(ArgumentError, /id cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::UpdateTransactionsRequestTransactionsInner.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::UpdateTransactionsRequestTransactionsInner.new(valid_attributes.merge(id: 99999))
      expect(instance).not_to eq(other)
    end
  end
end
