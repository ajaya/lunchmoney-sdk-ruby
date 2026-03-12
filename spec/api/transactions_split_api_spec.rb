require 'spec_helper'
require 'json'

describe LunchMoney::TransactionsSplitApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::TransactionsSplitApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of TransactionsSplitApi' do
      expect(api_instance).to be_instance_of(LunchMoney::TransactionsSplitApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#split_transaction' do
    let(:response_body) do
      {
        id: 400,
        date: '2025-01-15',
        amount: '-100.00',
        currency: 'usd',
        to_base: 1.0,
        payee: 'Split Parent',
        original_name: 'Original Transaction',
        category_id: 1,
        notes: nil,
        tag_ids: [],
        status: 'reviewed',
        is_pending: false,
        is_split_parent: true,
        is_group_parent: false,
        created_at: '2025-01-15T00:00:00.000Z',
        updated_at: '2025-01-15T00:00:00.000Z',
        source: 'manual'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/transactions\/split\/\d+/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a TransactionObject' do
      result = api_instance.split_transaction(400, { amounts: ['-60.00', '-40.00'] })
      expect(result).to be_instance_of(LunchMoney::TransactionObject)
    end

    it 'deserializes attributes correctly' do
      result = api_instance.split_transaction(400, { amounts: ['-60.00', '-40.00'] })
      expect(result.id).to eq(400)
      expect(result.amount).to eq('-100.00')
      expect(result.payee).to eq('Split Parent')
      expect(result.is_split_parent).to eq(true)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.split_transaction_with_http_info(400, { amounts: ['-60.00', '-40.00'] })
      expect(data).to be_instance_of(LunchMoney::TransactionObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#unsplit_transaction' do
    before do
      stub_response = Typhoeus::Response.new(
        code: 204,
        body: '',
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/transactions\/split\/\d+/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns nil for a DELETE request' do
      result = api_instance.unsplit_transaction(400)
      expect(result).to be_nil
    end

    it 'returns status code 204 with _with_http_info' do
      data, status, headers = api_instance.unsplit_transaction_with_http_info(400)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
