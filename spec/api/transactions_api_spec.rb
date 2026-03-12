require 'spec_helper'
require 'json'

describe LunchMoney::TransactionsApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::TransactionsApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of TransactionsApi' do
      expect(api_instance).to be_instance_of(LunchMoney::TransactionsApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_transaction_by_id' do
    let(:response_body) do
      {
        id: 100,
        date: '2025-01-15',
        amount: '-45.99',
        currency: 'usd',
        to_base: 1.0,
        payee: 'Amazon',
        original_name: 'AMZN Mktp US',
        category_id: 1,
        notes: 'Office supplies',
        tag_ids: [],
        status: 'reviewed',
        is_pending: false,
        is_split_parent: false,
        is_group_parent: false,
        created_at: '2025-01-15T00:00:00.000Z',
        updated_at: '2025-01-15T00:00:00.000Z',
        source: 'plaid'
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a TransactionObject' do
      result = api_instance.get_transaction_by_id(100)
      expect(result).to be_instance_of(LunchMoney::TransactionObject)
    end

    it 'deserializes attributes correctly' do
      result = api_instance.get_transaction_by_id(100)
      expect(result.id).to eq(100)
      expect(result.amount).to eq('-45.99')
      expect(result.payee).to eq('Amazon')
      expect(result.notes).to eq('Office supplies')
      expect(result.status).to eq('reviewed')
      expect(result.is_pending).to eq(false)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_transaction_by_id_with_http_info(100)
      expect(data).to be_instance_of(LunchMoney::TransactionObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#update_transaction' do
    let(:response_body) do
      {
        id: 100,
        date: '2025-01-15',
        amount: '-50.00',
        currency: 'usd',
        to_base: 1.0,
        payee: 'Updated Payee',
        original_name: 'AMZN Mktp US',
        category_id: 2,
        notes: 'Updated notes',
        tag_ids: [],
        status: 'reviewed',
        is_pending: false,
        is_split_parent: false,
        is_group_parent: false,
        created_at: '2025-01-15T00:00:00.000Z',
        updated_at: '2025-01-16T00:00:00.000Z',
        source: 'plaid'
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a TransactionObject' do
      result = api_instance.update_transaction(100, { payee: 'Updated Payee' })
      expect(result).to be_instance_of(LunchMoney::TransactionObject)
    end

    it 'deserializes attributes correctly' do
      result = api_instance.update_transaction(100, { payee: 'Updated Payee' })
      expect(result.id).to eq(100)
      expect(result.amount).to eq('-50.00')
      expect(result.payee).to eq('Updated Payee')
      expect(result.notes).to eq('Updated notes')
      expect(result.category_id).to eq(2)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.update_transaction_with_http_info(100, { payee: 'Updated Payee' })
      expect(data).to be_instance_of(LunchMoney::TransactionObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#delete_transaction_by_id' do
    before do
      stub_httpx_response(api_client, status: 204, body: '', headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns nil for a DELETE request' do
      result = api_instance.delete_transaction_by_id(100)
      expect(result).to be_nil
    end

    it 'returns status code 204 with _with_http_info' do
      data, status, headers = api_instance.delete_transaction_by_id_with_http_info(100)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
