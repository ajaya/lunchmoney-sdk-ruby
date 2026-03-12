require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::RecurringObject do
  let(:now) { Time.now }
  let(:overrides) { LunchMoney::RecurringObjectOverrides.new(payee: 'Netflix') }
  let(:criteria) do
    LunchMoney::RecurringObjectTransactionCriteria.new(
      granularity: 'month',
      quantity: 1,
      anchor_date: Date.new(2025, 1, 15),
      amount: '9.99',
      to_base: 9.99,
      currency: 'usd'
    )
  end
  let(:valid_attributes) do
    {
      id: 501,
      description: 'Monthly rent payment',
      status: 'reviewed',
      transaction_criteria: criteria,
      overrides: overrides,
      matches: nil,
      created_by: 42,
      created_at: now,
      updated_at: now,
      source: 'manual'
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.id).to eq(501)
      expect(obj.description).to eq('Monthly rent payment')
      expect(obj.status).to eq('reviewed')
      expect(obj.transaction_criteria).to eq(criteria)
      expect(obj.overrides).to eq(overrides)
      expect(obj.created_by).to eq(42)
      expect(obj.created_at).to eq(now)
      expect(obj.updated_at).to eq(now)
      expect(obj.source).to eq('manual')
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(bogus_key: 'nope') }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'nullable attributes' do
    it 'allows description to be nil' do
      attrs = valid_attributes.merge(description: nil)
      obj = described_class.new(attrs)
      expect(obj.description).to be_nil
    end

    it 'allows matches to be nil' do
      attrs = valid_attributes.merge(matches: nil)
      obj = described_class.new(attrs)
      expect(obj.matches).to be_nil
    end
  end

  describe 'required attributes raise on nil' do
    it 'raises when id is set to nil' do
      expect { described_class.new(valid_attributes).id = nil }.to raise_error(ArgumentError, /id cannot be nil/)
    end

    it 'raises when created_by is set to nil' do
      expect { described_class.new(valid_attributes).created_by = nil }.to raise_error(ArgumentError, /created_by cannot be nil/)
    end

    it 'raises when source is set to invalid value' do
      expect { described_class.new(valid_attributes).source = 'invalid' }.to raise_error(ArgumentError, /invalid value for "source"/)
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
      obj2 = described_class.new(valid_attributes.merge(id: 999))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:id]).to eq(501)
      expect(hash[:status]).to eq('reviewed')
      expect(hash[:created_by]).to eq(42)
      expect(hash[:source]).to eq('manual')
    end

    it 'includes nullable attributes that are nil' do
      obj = described_class.new(valid_attributes.merge(description: nil))
      hash = obj.to_hash
      expect(hash).to have_key(:description)
      expect(hash[:description]).to be_nil
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = {
        id: 501,
        description: 'Monthly rent payment',
        status: 'reviewed',
        transaction_criteria: { granularity: 'month', quantity: 1, anchor_date: '2025-01-15', amount: '9.99', to_base: 9.99, currency: 'usd' },
        overrides: { payee: 'Netflix' },
        created_by: 42,
        created_at: now.iso8601,
        updated_at: now.iso8601,
        source: 'manual'
      }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.id).to eq(501)
      expect(obj.description).to eq('Monthly rent payment')
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
