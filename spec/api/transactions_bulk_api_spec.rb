require 'spec_helper'
require 'json'

describe LunchMoney::TransactionsBulkApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::TransactionsBulkApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of TransactionsBulkApi' do
      expect(api_instance).to be_instance_of(LunchMoney::TransactionsBulkApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_all_transactions' do
    let(:response_body) do
      {
        transactions: [
          {
            id: 200,
            date: '2025-01-10',
            amount: '-12.50',
            currency: 'usd',
            to_base: 1.0,
            payee: 'Starbucks',
            original_name: 'STARBUCKS STORE',
            category_id: 2,
            tag_ids: [],
            notes: nil,
            status: 'unreviewed',
            is_pending: false,
            is_split_parent: false,
            is_group_parent: false,
            created_at: '2025-01-10T00:00:00.000Z',
            updated_at: '2025-01-10T00:00:00.000Z',
            source: 'plaid'
          }
        ],
        has_more: false
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a GetAllTransactions200Response' do
      result = api_instance.get_all_transactions
      expect(result).to be_instance_of(LunchMoney::GetAllTransactions200Response)
    end

    it 'deserializes transactions array' do
      result = api_instance.get_all_transactions
      expect(result.transactions).to be_an(Array)
      expect(result.transactions.length).to eq(1)
      expect(result.transactions.first).to be_instance_of(LunchMoney::TransactionObject)
      expect(result.transactions.first.id).to eq(200)
      expect(result.transactions.first.payee).to eq('Starbucks')
      expect(result.has_more).to eq(false)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_all_transactions_with_http_info
      expect(data).to be_instance_of(LunchMoney::GetAllTransactions200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#create_new_transactions' do
    let(:transaction_data) do
      {
        id: 301,
        date: '2025-01-15',
        amount: '-25.00',
        currency: 'usd',
        to_base: 1.0,
        payee: 'Grocery Store',
        original_name: 'GROCERY STORE #123',
        category_id: 5,
        tag_ids: [],
        notes: nil,
        status: 'unreviewed',
        is_pending: false,
        is_split_parent: false,
        is_group_parent: false,
        created_at: '2025-01-15T00:00:00.000Z',
        updated_at: '2025-01-15T00:00:00.000Z',
        source: 'manual'
      }
    end

    let(:response_body) do
      {
        transactions: [transaction_data],
        skipped_duplicates: []
      }.to_json
    end

    let(:request_body) do
      LunchMoney::CreateNewTransactionsRequest.new(
        transactions: [{ payee: 'Grocery Store', amount: '25.00', date: '2025-01-15' }],
        apply_rules: false,
        skip_duplicates: false
      )
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns an UpdateTransactions200Response via debug_return_type override' do
      # InsertTransactionsResponseObject model is not generated; use compatible type
      result = api_instance.create_new_transactions(request_body, { debug_return_type: 'UpdateTransactions200Response' })
      expect(result).to be_instance_of(LunchMoney::UpdateTransactions200Response)
    end

    it 'deserializes the transactions array' do
      result = api_instance.create_new_transactions(request_body, { debug_return_type: 'UpdateTransactions200Response' })
      expect(result.transactions).to be_an(Array)
      expect(result.transactions.length).to eq(1)
      expect(result.transactions.first).to be_instance_of(LunchMoney::TransactionObject)
      expect(result.transactions.first.id).to eq(301)
      expect(result.transactions.first.payee).to eq('Grocery Store')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.create_new_transactions_with_http_info(request_body, { debug_return_type: 'UpdateTransactions200Response' })
      expect(data).to be_instance_of(LunchMoney::UpdateTransactions200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#update_transactions' do
    let(:response_body) do
      {
        transactions: [
          {
            id: 200,
            date: '2025-01-10',
            amount: '-15.00',
            currency: 'usd',
            to_base: 1.0,
            payee: 'Updated Payee',
            original_name: 'STARBUCKS STORE',
            category_id: 3,
            tag_ids: [],
            notes: 'updated notes',
            status: 'reviewed',
            is_pending: false,
            is_split_parent: false,
            is_group_parent: false,
            created_at: '2025-01-10T00:00:00.000Z',
            updated_at: '2025-01-11T00:00:00.000Z',
            source: 'plaid'
          }
        ]
      }.to_json
    end

    let(:request_body) do
      LunchMoney::UpdateTransactionsRequest.new(
        transactions: [{ id: 200, payee: 'Updated Payee', notes: 'updated notes' }]
      )
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns an UpdateTransactions200Response' do
      result = api_instance.update_transactions(request_body)
      expect(result).to be_instance_of(LunchMoney::UpdateTransactions200Response)
    end

    it 'deserializes the updated transactions' do
      result = api_instance.update_transactions(request_body)
      expect(result.transactions).to be_an(Array)
      expect(result.transactions.length).to eq(1)
      expect(result.transactions.first).to be_instance_of(LunchMoney::TransactionObject)
      expect(result.transactions.first.id).to eq(200)
      expect(result.transactions.first.payee).to eq('Updated Payee')
      expect(result.transactions.first.notes).to eq('updated notes')
      expect(result.transactions.first.status).to eq('reviewed')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.update_transactions_with_http_info(request_body)
      expect(data).to be_instance_of(LunchMoney::UpdateTransactions200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#delete_transactions' do
    let(:request_body) do
      LunchMoney::DeleteTransactionsRequest.new(ids: [100, 101, 102])
    end

    before do
      stub_httpx_response(api_client, status: 204, body: '', headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns nil' do
      result = api_instance.delete_transactions(request_body)
      expect(result).to be_nil
    end

    it 'returns status code 204 with _with_http_info' do
      data, status, headers = api_instance.delete_transactions_with_http_info(request_body)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
