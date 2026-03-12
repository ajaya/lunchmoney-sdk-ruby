require 'spec_helper'
require 'json'

describe LunchMoney::MeApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::MeApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of MeApi' do
      expect(api_instance).to be_instance_of(LunchMoney::MeApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_me' do
    let(:response_body) do
      {
        name: 'Test User',
        email: 'test@example.com',
        id: 123,
        account_id: 456,
        budget_name: 'My Budget',
        primary_currency: 'usd',
        api_key_label: nil
      }.to_json
    end

    before do
      stub_httpx_response(api_client, status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
    end


    it 'returns a UserObject' do
      result = api_instance.get_me
      expect(result).to be_instance_of(LunchMoney::UserObject)
    end

    it 'deserializes attributes correctly' do
      result = api_instance.get_me
      expect(result.name).to eq('Test User')
      expect(result.email).to eq('test@example.com')
      expect(result.id).to eq(123)
      expect(result.account_id).to eq(456)
      expect(result.budget_name).to eq('My Budget')
      expect(result.primary_currency).to eq('usd')
      expect(result.api_key_label).to be_nil
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_me_with_http_info
      expect(data).to be_instance_of(LunchMoney::UserObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[]) # Hash
    end
  end
end
