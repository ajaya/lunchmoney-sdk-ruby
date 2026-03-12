require 'spec_helper'
require 'json'

describe LunchMoney::TransactionsGroupApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::TransactionsGroupApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of TransactionsGroupApi' do
      expect(api_instance).to be_instance_of(LunchMoney::TransactionsGroupApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#group_transactions' do
    let(:response_body) do
      {
        id: 301,
        date: '2025-01-15',
        amount: '-120.00',
        currency: 'usd',
        to_base: 1.0,
        payee: 'Grouped Transaction',
        original_name: 'Grouped Transaction',
        category_id: 1,
        notes: nil,
        tag_ids: [],
        status: 'reviewed',
        is_pending: false,
        is_split_parent: false,
        is_group_parent: true,
        created_at: '2025-01-15T00:00:00.000Z',
        updated_at: '2025-01-15T00:00:00.000Z',
        source: 'manual'
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a TransactionObject' do
      result = api_instance.group_transactions({ transaction_ids: [100, 101] })
      expect(result).to be_instance_of(LunchMoney::TransactionObject)
    end

    it 'deserializes attributes correctly' do
      result = api_instance.group_transactions({ transaction_ids: [100, 101] })
      expect(result.id).to eq(301)
      expect(result.amount).to eq('-120.00')
      expect(result.payee).to eq('Grouped Transaction')
      expect(result.is_group_parent).to eq(true)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.group_transactions_with_http_info({ transaction_ids: [100, 101] })
      expect(data).to be_instance_of(LunchMoney::TransactionObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#ungroup_transactions' do
    let(:response_body) { '' }

    before do
      stub_httpx_response(api_client, status: 204, body: '', headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns nil for a DELETE request' do
      result = api_instance.ungroup_transactions(300)
      expect(result).to be_nil
    end

    it 'returns status code 204 with _with_http_info' do
      data, status, headers = api_instance.ungroup_transactions_with_http_info(300)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
