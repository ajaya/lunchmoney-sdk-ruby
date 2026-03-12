require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::ErrorResponseObject do
  let(:valid_attributes) do
    {
      message: 'Request Validation Failure',
      errors: [LunchMoney::ErrorResponseObjectErrorsInner.new(err_msg: 'Field is required')]
    }
  end

  describe 'initialization' do
    it 'creates an instance with valid attributes' do
      obj = described_class.new(valid_attributes)
      expect(obj).to be_a(described_class)
    end

    it 'sets attribute values correctly' do
      obj = described_class.new(valid_attributes)
      expect(obj.message).to eq('Request Validation Failure')
      expect(obj.errors).to be_an(Array)
      expect(obj.errors.length).to eq(1)
      expect(obj.errors.first.err_msg).to eq('Field is required')
    end

    it 'raises ArgumentError on invalid keys' do
      expect { described_class.new(status_code: 400) }.to raise_error(ArgumentError, /not a valid attribute/)
    end
  end

  describe 'required attributes raise on nil' do
    it 'raises when message is set to nil' do
      expect { described_class.new(valid_attributes).message = nil }.to raise_error(ArgumentError, /message cannot be nil/)
    end

    it 'raises when errors is set to nil' do
      expect { described_class.new(valid_attributes).errors = nil }.to raise_error(ArgumentError, /errors cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with the same attributes equal' do
      errors_a = [LunchMoney::ErrorResponseObjectErrorsInner.new(err_msg: 'err')]
      errors_b = [LunchMoney::ErrorResponseObjectErrorsInner.new(err_msg: 'err')]
      obj1 = described_class.new(message: 'Not Found', errors: errors_a)
      obj2 = described_class.new(message: 'Not Found', errors: errors_b)
      expect(obj1).to eq(obj2)
    end

    it 'considers objects with different attributes not equal' do
      obj1 = described_class.new(valid_attributes)
      obj2 = described_class.new(valid_attributes.merge(message: 'Not Found'))
      expect(obj1).not_to eq(obj2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      obj = described_class.new(valid_attributes)
      hash = obj.to_hash
      expect(hash[:message]).to eq('Request Validation Failure')
      expect(hash[:errors]).to be_an(Array)
    end
  end

  describe '.build_from_hash' do
    it 'builds an object from a JSON-style hash' do
      json_hash = {
        message: 'Not Found',
        errors: [{ errMsg: 'Resource not found' }]
      }
      obj = described_class.build_from_hash(json_hash)
      expect(obj).to be_a(described_class)
      expect(obj.message).to eq('Not Found')
      expect(obj.errors.first).to be_a(LunchMoney::ErrorResponseObjectErrorsInner)
      expect(obj.errors.first.err_msg).to eq('Resource not found')
    end

    it 'returns nil for non-hash input' do
      expect(described_class.build_from_hash(nil)).to be_nil
    end
  end
end
