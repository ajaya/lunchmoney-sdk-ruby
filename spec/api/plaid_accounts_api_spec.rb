require 'spec_helper'
require 'json'

describe LunchMoney::PlaidAccountsApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::PlaidAccountsApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of PlaidAccountsApi' do
      expect(api_instance).to be_instance_of(LunchMoney::PlaidAccountsApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_all_plaid_accounts' do
    let(:response_body) do
      {
        plaid_accounts: [
          {
            id: 20,
            plaid_item_id: 'item_abc123',
            date_linked: '2025-01-01',
            linked_by_name: 'Test User',
            name: 'Checking Account',
            display_name: 'Checking',
            type: 'depository',
            subtype: 'checking',
            mask: '1234',
            institution_name: 'Chase',
            status: 'active',
            allow_transaction_modifications: true,
            balance: '2500.50',
            currency: 'usd',
            to_base: 2500.50,
            balance_last_update: '2025-01-15T00:00:00.000Z',
            created_at: '2025-01-01T00:00:00.000Z',
            updated_at: '2025-01-15T00:00:00.000Z'
          }
        ]
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/plaid_accounts/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a GetAllPlaidAccounts200Response' do
      result = api_instance.get_all_plaid_accounts
      expect(result).to be_instance_of(LunchMoney::GetAllPlaidAccounts200Response)
    end

    it 'deserializes plaid_accounts array' do
      result = api_instance.get_all_plaid_accounts
      expect(result.plaid_accounts).to be_an(Array)
      expect(result.plaid_accounts.length).to eq(1)
      expect(result.plaid_accounts.first).to be_instance_of(LunchMoney::PlaidAccountObject)
      expect(result.plaid_accounts.first.name).to eq('Checking Account')
      expect(result.plaid_accounts.first.id).to eq(20)
      expect(result.plaid_accounts.first.institution_name).to eq('Chase')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_all_plaid_accounts_with_http_info
      expect(data).to be_instance_of(LunchMoney::GetAllPlaidAccounts200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#get_plaid_account_by_id' do
    let(:response_body) do
      {
        id: 25,
        plaid_item_id: 'item_xyz789',
        date_linked: '2025-02-01',
        linked_by_name: 'Jane Doe',
        name: 'Savings Account',
        display_name: 'Savings',
        type: 'depository',
        subtype: 'savings',
        mask: '5678',
        institution_name: 'Bank of America',
        status: 'active',
        allow_transaction_modifications: false,
        balance: '10000.00',
        currency: 'usd',
        to_base: 10000.00,
        balance_last_update: '2025-02-15T00:00:00.000Z',
        created_at: '2025-02-01T00:00:00.000Z',
        updated_at: '2025-02-15T00:00:00.000Z'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/plaid_accounts\/25/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a PlaidAccountObject' do
      result = api_instance.get_plaid_account_by_id(25)
      expect(result).to be_instance_of(LunchMoney::PlaidAccountObject)
    end

    it 'deserializes the plaid account fields' do
      result = api_instance.get_plaid_account_by_id(25)
      expect(result.id).to eq(25)
      expect(result.name).to eq('Savings Account')
      expect(result.institution_name).to eq('Bank of America')
      expect(result.mask).to eq('5678')
      expect(result.to_base).to eq(10000.00)
      expect(result.status).to eq('active')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_plaid_account_by_id_with_http_info(25)
      expect(data).to be_instance_of(LunchMoney::PlaidAccountObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#trigger_plaid_account_fetch' do
    before do
      stub_response = Typhoeus::Response.new(
        code: 202,
        body: '',
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/plaid_accounts\/fetch/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns nil' do
      result = api_instance.trigger_plaid_account_fetch
      expect(result).to be_nil
    end

    it 'returns status code 202 with _with_http_info' do
      _data, status, headers = api_instance.trigger_plaid_account_fetch_with_http_info
      expect(status).to eq(202)
      expect(headers).to respond_to(:[])
    end

    it 'accepts optional parameters' do
      result = api_instance.trigger_plaid_account_fetch(
        start_date: '2025-01-01',
        end_date: '2025-01-31',
        id: 20
      )
      expect(result).to be_nil
    end
  end
end
