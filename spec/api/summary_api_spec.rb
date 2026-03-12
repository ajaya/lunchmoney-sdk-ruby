require 'spec_helper'
require 'json'

describe LunchMoney::SummaryApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::SummaryApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of SummaryApi' do
      expect(api_instance).to be_instance_of(LunchMoney::SummaryApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_budget_summary' do
    let(:response_body) do
      {
        aligned: true,
        categories: [],
        totals: nil,
        rollover_pool: nil
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a SummaryResponseObject' do
      result = api_instance.get_budget_summary('2025-01-01', '2025-01-31')
      expect(result).to be_instance_of(LunchMoney::SummaryResponseObject)
    end

    it 'deserializes attributes correctly' do
      result = api_instance.get_budget_summary('2025-01-01', '2025-01-31')
      expect(result.aligned).to eq(true)
      expect(result.categories).to be_an(Array)
      expect(result.categories).to be_empty
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_budget_summary_with_http_info('2025-01-01', '2025-01-31')
      expect(data).to be_instance_of(LunchMoney::SummaryResponseObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end
end
