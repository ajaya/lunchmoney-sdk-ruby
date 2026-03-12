require 'spec_helper'
require 'json'

describe LunchMoney::RecurringItemsApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::RecurringItemsApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of RecurringItemsApi' do
      expect(api_instance).to be_instance_of(LunchMoney::RecurringItemsApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_all_recurring' do
    let(:response_body) do
      {
        recurring_items: [
          {
            id: 30,
            description: 'Netflix Subscription',
            status: 'suggested',
            transaction_criteria: {
              start_date: nil,
              end_date: nil,
              granularity: 'month',
              quantity: 1,
              anchor_date: '2025-01-01',
              payee: nil,
              amount: '15.99',
              to_base: '15.99',
              currency: 'usd',
              plaid_account_id: nil,
              manual_account_id: nil
            },
            overrides: {
              payee: nil,
              notes: nil,
              category_id: nil
            },
            matches: nil,
            created_by: 1,
            created_at: '2025-01-01T00:00:00.000Z',
            updated_at: '2025-01-15T00:00:00.000Z',
            source: 'manual'
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
      Typhoeus.stub(/\/recurring_items/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a GetAllRecurring200Response' do
      result = api_instance.get_all_recurring
      expect(result).to be_instance_of(LunchMoney::GetAllRecurring200Response)
    end

    it 'deserializes recurring_items array' do
      result = api_instance.get_all_recurring
      expect(result.recurring_items).to be_an(Array)
      expect(result.recurring_items.length).to eq(1)
      expect(result.recurring_items.first).to be_instance_of(LunchMoney::RecurringObject)
      expect(result.recurring_items.first.id).to eq(30)
      expect(result.recurring_items.first.description).to eq('Netflix Subscription')
      expect(result.recurring_items.first.source).to eq('manual')
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_all_recurring_with_http_info
      expect(data).to be_instance_of(LunchMoney::GetAllRecurring200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#get_recurring_by_id' do
    let(:response_body) do
      {
        id: 35,
        description: 'Spotify Premium',
        status: 'reviewed',
        transaction_criteria: {
          start_date: nil,
          end_date: nil,
          granularity: 'month',
          quantity: 1,
          anchor_date: '2025-02-01',
          payee: nil,
          amount: '9.99',
          to_base: '9.99',
          currency: 'usd',
          plaid_account_id: nil,
          manual_account_id: nil
        },
        overrides: {
          payee: nil,
          notes: nil,
          category_id: nil
        },
        matches: nil,
        created_by: 1,
        created_at: '2025-02-01T00:00:00.000Z',
        updated_at: '2025-02-15T00:00:00.000Z',
        source: 'transaction'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/recurring_items\/35/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a RecurringObject' do
      result = api_instance.get_recurring_by_id(35)
      expect(result).to be_instance_of(LunchMoney::RecurringObject)
    end

    it 'deserializes the recurring item fields' do
      result = api_instance.get_recurring_by_id(35)
      expect(result.id).to eq(35)
      expect(result.description).to eq('Spotify Premium')
      expect(result.status).to eq('reviewed')
      expect(result.source).to eq('transaction')
      expect(result.transaction_criteria).to be_instance_of(LunchMoney::RecurringObjectTransactionCriteria)
      expect(result.overrides).to be_instance_of(LunchMoney::RecurringObjectOverrides)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_recurring_by_id_with_http_info(35)
      expect(data).to be_instance_of(LunchMoney::RecurringObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end
end
