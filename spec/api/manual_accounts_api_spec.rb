require 'spec_helper'
require 'json'

describe LunchMoney::ManualAccountsApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::ManualAccountsApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of ManualAccountsApi' do
      expect(api_instance).to be_instance_of(LunchMoney::ManualAccountsApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_all_manual_accounts' do
    let(:response_body) do
      {
        manual_accounts: [
          {
            id: 10,
            name: 'Savings Account',
            institution_name: 'My Bank',
            display_name: 'Savings',
            type: 'cash',
            subtype: 'savings',
            balance: '5000.00',
            currency: 'usd',
            to_base: 1.0,
            balance_as_of: '2025-01-15T00:00:00.000Z',
            status: 'active',
            closed_on: nil,
            exclude_from_transactions: false,
            created_by_name: 'Test User',
            created_at: '2025-01-01T00:00:00.000Z',
            updated_at: '2025-01-15T00:00:00.000Z'
          }
        ]
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a GetAllManualAccounts200Response' do
      result = api_instance.get_all_manual_accounts
      expect(result).to be_instance_of(LunchMoney::GetAllManualAccounts200Response)
    end

    it 'deserializes manual_accounts array' do
      result = api_instance.get_all_manual_accounts
      expect(result.manual_accounts).to be_an(Array)
      expect(result.manual_accounts.length).to eq(1)
      expect(result.manual_accounts.first).to be_instance_of(LunchMoney::ManualAccountObject)
      expect(result.manual_accounts.first.name).to eq('Savings Account')
      expect(result.manual_accounts.first.id).to eq(10)
      expect(result.manual_accounts.first.balance).to eq('5000.00')
      expect(result.manual_accounts.first.currency).to eq('usd')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_all_manual_accounts_with_http_info
      expect(data).to be_instance_of(LunchMoney::GetAllManualAccounts200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#get_manual_account_by_id' do
    let(:response_body) do
      {
        id: 10,
        name: 'Savings Account',
        institution_name: 'My Bank',
        display_name: 'Savings',
        type: 'cash',
        subtype: 'savings',
        balance: '5000.00',
        currency: 'usd',
        to_base: 1.0,
        balance_as_of: '2025-01-15T00:00:00.000Z',
        status: 'active',
        closed_on: nil,
        exclude_from_transactions: false,
        created_by_name: 'Test User',
        created_at: '2025-01-01T00:00:00.000Z',
        updated_at: '2025-01-15T00:00:00.000Z'
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a ManualAccountObject' do
      result = api_instance.get_manual_account_by_id(10)
      expect(result).to be_instance_of(LunchMoney::ManualAccountObject)
    end

    it 'deserializes the manual account fields' do
      result = api_instance.get_manual_account_by_id(10)
      expect(result.id).to eq(10)
      expect(result.name).to eq('Savings Account')
      expect(result.institution_name).to eq('My Bank')
      expect(result.type).to eq('cash')
      expect(result.balance).to eq('5000.00')
      expect(result.currency).to eq('usd')
      expect(result.to_base).to eq(1.0)
      expect(result.exclude_from_transactions).to eq(false)
      expect(result.created_by_name).to eq('Test User')
      expect(result.status).to eq('active')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_manual_account_by_id_with_http_info(10)
      expect(data).to be_instance_of(LunchMoney::ManualAccountObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#create_manual_account' do
    let(:response_body) do
      {
        id: 20,
        name: 'New Checking',
        institution_name: 'Another Bank',
        display_name: 'Checking',
        type: 'cash',
        subtype: 'checking',
        balance: '1500.00',
        currency: 'usd',
        to_base: 1.0,
        balance_as_of: '2025-02-01T00:00:00.000Z',
        status: 'active',
        closed_on: nil,
        exclude_from_transactions: false,
        created_by_name: 'Test User',
        created_at: '2025-02-01T00:00:00.000Z',
        updated_at: '2025-02-01T00:00:00.000Z'
      }.to_json
    end

    let(:request_body) do
      {
        name: 'New Checking',
        type: 'cash',
        balance: '1500.00',
        currency: 'usd'
      }
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a ManualAccountObject' do
      result = api_instance.create_manual_account(request_body)
      expect(result).to be_instance_of(LunchMoney::ManualAccountObject)
    end

    it 'deserializes the created manual account' do
      result = api_instance.create_manual_account(request_body)
      expect(result.id).to eq(20)
      expect(result.name).to eq('New Checking')
      expect(result.institution_name).to eq('Another Bank')
      expect(result.type).to eq('cash')
      expect(result.balance).to eq('1500.00')
      expect(result.currency).to eq('usd')
      expect(result.to_base).to eq(1.0)
      expect(result.exclude_from_transactions).to eq(false)
      expect(result.created_by_name).to eq('Test User')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.create_manual_account_with_http_info(request_body)
      expect(data).to be_instance_of(LunchMoney::ManualAccountObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#update_manual_account' do
    let(:response_body) do
      {
        id: 10,
        name: 'Updated Savings',
        institution_name: 'My Bank',
        display_name: 'Savings',
        type: 'investment',
        subtype: 'retirement',
        balance: '7500.00',
        currency: 'usd',
        to_base: 1.0,
        balance_as_of: '2025-03-01T00:00:00.000Z',
        status: 'active',
        closed_on: nil,
        exclude_from_transactions: true,
        created_by_name: 'Test User',
        created_at: '2025-01-01T00:00:00.000Z',
        updated_at: '2025-03-01T00:00:00.000Z'
      }.to_json
    end

    let(:request_body) do
      {
        name: 'Updated Savings',
        type: 'investment',
        balance: '7500.00'
      }
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a ManualAccountObject' do
      result = api_instance.update_manual_account(10, request_body)
      expect(result).to be_instance_of(LunchMoney::ManualAccountObject)
    end

    it 'deserializes the updated manual account' do
      result = api_instance.update_manual_account(10, request_body)
      expect(result.id).to eq(10)
      expect(result.name).to eq('Updated Savings')
      expect(result.type).to eq('investment')
      expect(result.subtype).to eq('retirement')
      expect(result.balance).to eq('7500.00')
      expect(result.to_base).to eq(1.0)
      expect(result.exclude_from_transactions).to eq(true)
      expect(result.created_by_name).to eq('Test User')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.update_manual_account_with_http_info(10, request_body)
      expect(data).to be_instance_of(LunchMoney::ManualAccountObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#delete_manual_account' do
    before do
      stub_httpx_response(api_client, status: 204, body: '', headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns nil' do
      result = api_instance.delete_manual_account(10)
      expect(result).to be_nil
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.delete_manual_account_with_http_info(10)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
