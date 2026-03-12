require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::RecurringObjectTransactionCriteria do
  let(:valid_attributes) do
    {
      start_date: Date.new(2025, 1, 1),
      end_date: Date.new(2025, 12, 31),
      granularity: 'month',
      quantity: 1,
      anchor_date: Date.new(2025, 1, 15),
      payee: 'Spotify',
      amount: '9.99',
      to_base: 9.99,
      currency: 'usd',
      plaid_account_id: 300,
      manual_account_id: nil
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.granularity).to eq('month')
      expect(obj.quantity).to eq(1)
      expect(obj.anchor_date).to eq(Date.new(2025, 1, 15))
      expect(obj.amount).to eq('9.99')
      expect(obj.to_base).to eq(9.99)
      expect(obj.currency).to eq('usd')
      expect(obj.plaid_account_id).to eq(300)
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(fake_field: 'x') }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'nullable attributes' do
    it 'allows start_date to be nil' do
      obj = described_class.new(valid_attributes.merge(start_date: nil))
      expect(obj.start_date).to be_nil
    end

    it 'allows end_date to be nil' do
      obj = described_class.new(valid_attributes.merge(end_date: nil))
      expect(obj.end_date).to be_nil
    end

    it 'allows payee to be nil' do
      obj = described_class.new(valid_attributes.merge(payee: nil))
      expect(obj.payee).to be_nil
    end

    it 'allows plaid_account_id to be nil' do
      obj = described_class.new(valid_attributes.merge(plaid_account_id: nil))
      expect(obj.plaid_account_id).to be_nil
    end

    it 'allows manual_account_id to be nil' do
      obj = described_class.new(valid_attributes.merge(manual_account_id: nil))
      expect(obj.manual_account_id).to be_nil
    end
  end

  describe 'required attributes raise on nil' do
    it 'raises when quantity is set to nil' do
      expect { described_class.new(valid_attributes).quantity = nil }.to raise_error(ArgumentError, /quantity cannot be nil/)
    end

    it 'raises when anchor_date is set to nil' do
      expect { described_class.new(valid_attributes).anchor_date = nil }.to raise_error(ArgumentError, /anchor_date cannot be nil/)
    end

    it 'raises when to_base is set to nil' do
      expect { described_class.new(valid_attributes).to_base = nil }.to raise_error(ArgumentError, /to_base cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with the same attributes equal' do
      obj1 = described_class.new(valid_attributes)
      obj2 = described_class.new(valid_attributes)
      expect(obj1).to eq(obj2)
    end

    it 'considers objects with different attributes not equal' do
      obj1 = described_class.new(valid_attributes)
      obj2 = described_class.new(valid_attributes.merge(quantity: 2))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:granularity]).to eq('month')
      expect(hash[:quantity]).to eq(1)
      expect(hash[:amount]).to eq('9.99')
      expect(hash[:to_base]).to eq(9.99)
      expect(hash[:currency]).to eq('usd')
    end

    it 'includes nullable attributes that are nil' do
      obj = described_class.new(valid_attributes.merge(start_date: nil, end_date: nil))
      hash = obj.to_hash
      expect(hash).to have_key(:start_date)
      expect(hash[:start_date]).to be_nil
      expect(hash).to have_key(:end_date)
      expect(hash[:end_date]).to be_nil
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = {
        granularity: 'month',
        quantity: 1,
        anchor_date: '2025-01-15',
        amount: '9.99',
        to_base: 9.99,
        currency: 'usd'
      }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.granularity).to eq('month')
      expect(obj.anchor_date).to eq(Date.new(2025, 1, 15))
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
