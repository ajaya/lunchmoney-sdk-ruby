require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::DeleteTransactionsRequest do
  let(:valid_attributes) do
    {
      ids: [101, 202, 303]
    }
  end

  let(:instance) { LunchMoney::DeleteTransactionsRequest.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of DeleteTransactionsRequest' do
      expect(instance).to be_instance_of(LunchMoney::DeleteTransactionsRequest)
    end

    it 'sets all attributes from hash' do
      expect(instance.ids).to eq([101, 202, 303])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::DeleteTransactionsRequest.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::DeleteTransactionsRequest.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when ids is set to nil' do
      expect {
        instance.ids = nil
      }.to raise_error(ArgumentError, /ids cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::DeleteTransactionsRequest.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::DeleteTransactionsRequest.new(ids: [999])
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:ids]).to eq([101, 202, 303])
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::DeleteTransactionsRequest.build_from_hash(valid_attributes)
      expect(obj.ids).to eq([101, 202, 303])
    end
  end
end
