require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::ErrorResponseObjectErrorsInner do
  let(:valid_attributes) do
    {
      err_msg: 'The "amount" field is required.'
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.err_msg).to eq('The "amount" field is required.')
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(error_code: 422) }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'required attributes raise on nil' do
    it 'raises when err_msg is set to nil' do
      expect { described_class.new(valid_attributes).err_msg = nil }.to raise_error(ArgumentError, /err_msg cannot be nil/)
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
      obj2 = described_class.new(err_msg: 'Different error message')
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:errMsg]).to eq('The "amount" field is required.')
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = { errMsg: 'Something went wrong' }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.err_msg).to eq('Something went wrong')
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
