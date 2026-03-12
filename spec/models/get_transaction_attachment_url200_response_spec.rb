require 'spec_helper'
require 'json'
require 'date'

describe LunchMoney::GetTransactionAttachmentUrl200Response do
  let(:valid_attributes) do
    {
      url: 'https://s3.amazonaws.com/lunchmoney/receipt-12345.png?token=abc',
      expires_at: '2025-06-15T12:00:00Z'
    }
  end

  let(:instance) { LunchMoney::GetTransactionAttachmentUrl200Response.new(valid_attributes) }

  describe 'initialization' do
    it 'creates an instance of GetTransactionAttachmentUrl200Response' do
      expect(instance).to be_instance_of(LunchMoney::GetTransactionAttachmentUrl200Response)
    end

    it 'sets all attributes from hash' do
      expect(instance.url).to eq('https://s3.amazonaws.com/lunchmoney/receipt-12345.png?token=abc')
      expect(instance.expires_at).to eq('2025-06-15T12:00:00Z')
    end

    it 'raises on invalid attribute keys' do
      expect {
        LunchMoney::GetTransactionAttachmentUrl200Response.new(bogus: 'value')
      }.to raise_error(ArgumentError, /bogus/)
    end

    it 'raises on non-hash argument' do
      expect {
        LunchMoney::GetTransactionAttachmentUrl200Response.new('not a hash')
      }.to raise_error(ArgumentError)
    end
  end

  describe 'required attributes' do
    it 'raises when url is set to nil' do
      expect {
        instance.url = nil
      }.to raise_error(ArgumentError, /url cannot be nil/)
    end

    it 'raises when expires_at is set to nil' do
      expect {
        instance.expires_at = nil
      }.to raise_error(ArgumentError, /expires_at cannot be nil/)
    end
  end

  describe '#==' do
    it 'considers two objects with same attributes as equal' do
      other = LunchMoney::GetTransactionAttachmentUrl200Response.new(valid_attributes)
      expect(instance).to eq(other)
    end

    it 'considers objects with different attributes as not equal' do
      other = LunchMoney::GetTransactionAttachmentUrl200Response.new(valid_attributes.merge(url: 'https://other.url'))
      expect(instance).not_to eq(other)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with JSON keys' do
      hash = instance.to_hash
      expect(hash[:url]).to include('lunchmoney')
      expect(hash[:expires_at]).not_to be_nil
    end
  end

  describe '.build_from_hash' do
    it 'constructs from a JSON-style hash with symbol keys' do
      obj = LunchMoney::GetTransactionAttachmentUrl200Response.build_from_hash(valid_attributes)
      expect(obj.url).to include('lunchmoney')
    end
  end
end
