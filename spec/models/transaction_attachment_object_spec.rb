require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::TransactionAttachmentObject do
  let(:now) { Time.now }
  let(:valid_attributes) do
    {
      id: 1001,
      uploaded_by: 42,
      name: 'receipt.pdf',
      type: 'application/pdf',
      size: 2048,
      notes: 'Grocery store receipt',
      created_at: now
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.id).to eq(1001)
      expect(obj.uploaded_by).to eq(42)
      expect(obj.name).to eq('receipt.pdf')
      expect(obj.type).to eq('application/pdf')
      expect(obj.size).to eq(2048)
      expect(obj.notes).to eq('Grocery store receipt')
      expect(obj.created_at).to eq(now)
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(file_path: '/tmp/file') }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'nullable attributes' do
    it 'allows notes to be nil' do
      obj = described_class.new(valid_attributes.merge(notes: nil))
      expect(obj.notes).to be_nil
    end
  end

  describe 'required attributes' do
    it 'allows id to be set without raising' do
      obj = described_class.new(valid_attributes)
      obj.id = 2002
      expect(obj.id).to eq(2002)
    end

    it 'allows name to be set without raising' do
      obj = described_class.new(valid_attributes)
      obj.name = 'invoice.png'
      expect(obj.name).to eq('invoice.png')
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
      obj2 = described_class.new(valid_attributes.merge(id: 9999))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:id]).to eq(1001)
      expect(hash[:uploaded_by]).to eq(42)
      expect(hash[:name]).to eq('receipt.pdf')
      expect(hash[:type]).to eq('application/pdf')
      expect(hash[:size]).to eq(2048)
    end

    it 'includes nullable notes when nil' do
      obj = described_class.new(valid_attributes.merge(notes: nil))
      hash = obj.to_hash
      expect(hash).to have_key(:notes)
      expect(hash[:notes]).to be_nil
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = {
        id: 1001,
        uploaded_by: 42,
        name: 'receipt.pdf',
        type: 'application/pdf',
        size: 2048,
        created_at: now.iso8601
      }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.id).to eq(1001)
      expect(obj.name).to eq('receipt.pdf')
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
