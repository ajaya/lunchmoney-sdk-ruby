require 'spec_helper'
require 'json'

describe LunchMoney::BudgetsApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::BudgetsApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of BudgetsApi' do
      expect(api_instance).to be_instance_of(LunchMoney::BudgetsApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_budget_settings' do
    let(:response_body) do
      {
        budget_period: 'monthly',
        budget_start_day: 1,
        currency: 'usd'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/budgets\/settings/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'responds to get_budget_settings' do
      expect(api_instance).to respond_to(:get_budget_settings)
    end

    it 'responds to get_budget_settings_with_http_info' do
      expect(api_instance).to respond_to(:get_budget_settings_with_http_info)
    end

    it 'raises NameError during deserialization because BudgetSettingsResponseObject model does not exist' do
      # The API method specifies return_type 'BudgetSettingsResponseObject' but
      # no such model class exists in the LunchMoney module, so const_get raises NameError.
      expect { api_instance.get_budget_settings }.to raise_error(NameError, /BudgetSettingsResponseObject/)
    end

    it 'can make the HTTP call and returns raw data when return_type is overridden' do
      # By overriding the return type to Object, we skip model deserialization
      # and get the parsed JSON hash back directly.
      data, status, headers = api_instance.get_budget_settings_with_http_info(
        debug_return_type: 'Object'
      )
      expect(data).to be_a(Hash)
      expect(data[:budget_period]).to eq('monthly')
      expect(data[:budget_start_day]).to eq(1)
      expect(data[:currency]).to eq('usd')
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#delete_budget' do
    before do
      stub_response = Typhoeus::Response.new(
        code: 204,
        body: '',
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/budgets/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'responds to delete_budget' do
      expect(api_instance).to respond_to(:delete_budget)
    end

    it 'returns nil for a DELETE request' do
      result = api_instance.delete_budget(42, '2026-03-01')
      expect(result).to be_nil
    end

    it 'returns status code 204 with _with_http_info' do
      data, status, headers = api_instance.delete_budget_with_http_info(42, '2026-03-01')
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end

    it 'raises ArgumentError when category_id is nil' do
      expect {
        api_instance.delete_budget(nil, '2026-03-01')
      }.to raise_error(ArgumentError, /category_id/)
    end

    it 'raises ArgumentError when start_date is nil' do
      expect {
        api_instance.delete_budget(42, nil)
      }.to raise_error(ArgumentError, /start_date/)
    end
  end

  describe '#upsert_budget' do
    let(:response_body) do
      {
        category_id: 42,
        start_date: '2026-03-01',
        amount: '500.00',
        currency: 'usd'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/budgets/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'responds to upsert_budget' do
      expect(api_instance).to respond_to(:upsert_budget)
    end

    it 'raises NameError during deserialization because BudgetUpsertResponseObject model does not exist' do
      # The API method specifies return_type 'BudgetUpsertResponseObject' but
      # no such model class exists in the LunchMoney module, so const_get raises NameError.
      request_body = { category_id: 42, start_date: '2026-03-01', amount: '500.00' }
      expect { api_instance.upsert_budget(request_body) }.to raise_error(NameError, /BudgetUpsertResponseObject/)
    end

    it 'can make the HTTP call and returns raw data when return_type is overridden' do
      request_body = { category_id: 42, start_date: '2026-03-01', amount: '500.00' }
      data, status, headers = api_instance.upsert_budget_with_http_info(
        request_body,
        debug_return_type: 'Object'
      )
      expect(data).to be_a(Hash)
      expect(data[:category_id]).to eq(42)
      expect(data[:start_date]).to eq('2026-03-01')
      expect(data[:amount]).to eq('500.00')
      expect(data[:currency]).to eq('usd')
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end

    it 'raises ArgumentError when request object is nil' do
      expect {
        api_instance.upsert_budget(nil)
      }.to raise_error(ArgumentError, /upsert_budget_request_object/)
    end
  end
end
