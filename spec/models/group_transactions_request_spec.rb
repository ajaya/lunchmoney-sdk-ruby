require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::GroupTransactionsRequest do
  let(:valid_attributes) do
    {
      ids: [100, 200, 300],
      date: Date.new(2025, 3, 15),
      payee: 'Grouped Coffee Shops',
      category_id: nil,
      notes: nil,
      status: 'reviewed',
      tag_ids: [10, 20]
    }
  end

  let(:instance) { LunchMoney::GroupTransactionsRequest.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of GroupTransactionsRequest' do
      expect(instance).to be_instance_of(LunchMoney::GroupTransactionsRequest)
    end

    it 'sets all attributes from hash' do
      expect(instance.ids).to eq([100, 200, 300])
      expect(instance.date).to eq(Date.new(2025, 3, 15))
      expect(instance.payee).to eq('Grouped Coffee Shops')
      expect(instance.category_id).to be_nil
      expect(instance.notes).to be_nil
      expect(instance.status).to eq('reviewed')
      expect(instance.tag_ids).to eq([10, 20])
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::GroupTransactionsRequest.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::GroupTransactionsRequest.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'nullable attributes' do
    it 'allows category_id to be nil' do
      expect(instance.category_id).to be_nil
    end

    it 'allows notes to be nil' do
      expect(instance.notes).to be_nil
    end
  end

  describe 'required attributes' do
    it 'raises when ids is set to nil' do
      expect {
        instance.ids = nil
      }.to raise_error(ArgumentError, /ids cannot be nil/)
    end

    it 'raises when date is set to nil' do
      expect {
        instance.date = nil
      }.to raise_error(ArgumentError, /date cannot be nil/)
    end

    it 'raises when payee is set to nil' do
      expect {
        instance.payee = nil
      }.to raise_error(ArgumentError, /payee cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::GroupTransactionsRequest.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::GroupTransactionsRequest.new(valid_attributes.merge(payee: 'Other'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:ids]).to eq([100, 200, 300])
      expect(hash[:date]).to eq(Date.new(2025, 3, 15))
      expect(hash[:payee]).to eq('Grouped Coffee Shops')
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      # build_from_hash deserializes values via _deserialize, which expects
      # date as a string (not a Date object) since it calls Date.parse.
      hash_attributes = valid_attributes.merge(date: '2025-03-15')
      obj = LunchMoney::GroupTransactionsRequest.build_from_hash(hash_attributes)
      expect(obj.ids).to eq([100, 200, 300])
      expect(obj.payee).to eq('Grouped Coffee Shops')
    end
  end
end
