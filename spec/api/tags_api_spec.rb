require 'spec_helper'
require 'json'

describe LunchMoney::TagsApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::TagsApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of TagsApi' do
      expect(api_instance).to be_instance_of(LunchMoney::TagsApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_all_tags' do
    let(:response_body) do
      {
        tags: [
          {
            id: 40,
            name: 'Travel',
            description: 'Travel-related expenses',
            text_color: '#ffffff',
            background_color: '#3498db',
            archived: false,
            archived_at: nil,
            updated_at: '2025-01-01T00:00:00.000Z',
            created_at: '2025-01-01T00:00:00.000Z'
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
      Typhoeus.stub(/\/tags/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a GetAllTags200Response' do
      result = api_instance.get_all_tags
      expect(result).to be_instance_of(LunchMoney::GetAllTags200Response)
    end

    it 'deserializes tags array' do
      result = api_instance.get_all_tags
      expect(result.tags).to be_an(Array)
      expect(result.tags.length).to eq(1)
      expect(result.tags.first).to be_instance_of(LunchMoney::TagObject)
      expect(result.tags.first.id).to eq(40)
      expect(result.tags.first.name).to eq('Travel')
      expect(result.tags.first.description).to eq('Travel-related expenses')
      expect(result.tags.first.archived).to eq(false)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_all_tags_with_http_info
      expect(data).to be_instance_of(LunchMoney::GetAllTags200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#get_tag_by_id' do
    let(:response_body) do
      {
        id: 40,
        name: 'Travel',
        description: 'Travel-related expenses',
        text_color: '#ffffff',
        background_color: '#3498db',
        archived: false,
        archived_at: nil,
        updated_at: '2025-01-01T00:00:00.000Z',
        created_at: '2025-01-01T00:00:00.000Z'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/tags\/\d+/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a TagObject' do
      result = api_instance.get_tag_by_id(40)
      expect(result).to be_instance_of(LunchMoney::TagObject)
    end

    it 'deserializes tag fields' do
      result = api_instance.get_tag_by_id(40)
      expect(result.id).to eq(40)
      expect(result.name).to eq('Travel')
      expect(result.description).to eq('Travel-related expenses')
      expect(result.text_color).to eq('#ffffff')
      expect(result.background_color).to eq('#3498db')
      expect(result.archived).to eq(false)
      expect(result.archived_at).to be_nil
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_tag_by_id_with_http_info(40)
      expect(data).to be_instance_of(LunchMoney::TagObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#create_tag' do
    let(:response_body) do
      {
        id: 50,
        name: 'Dining',
        description: 'Restaurant and dining expenses',
        text_color: '#000000',
        background_color: '#e74c3c',
        archived: false,
        archived_at: nil,
        updated_at: '2025-02-01T00:00:00.000Z',
        created_at: '2025-02-01T00:00:00.000Z'
      }.to_json
    end

    let(:request_body) do
      { name: 'Dining', description: 'Restaurant and dining expenses' }
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/tags/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a TagObject' do
      result = api_instance.create_tag(request_body)
      expect(result).to be_instance_of(LunchMoney::TagObject)
    end

    it 'deserializes the created tag' do
      result = api_instance.create_tag(request_body)
      expect(result.id).to eq(50)
      expect(result.name).to eq('Dining')
      expect(result.description).to eq('Restaurant and dining expenses')
      expect(result.text_color).to eq('#000000')
      expect(result.background_color).to eq('#e74c3c')
      expect(result.archived).to eq(false)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.create_tag_with_http_info(request_body)
      expect(data).to be_instance_of(LunchMoney::TagObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#update_tag' do
    let(:response_body) do
      {
        id: 40,
        name: 'Travel Updated',
        description: 'Updated travel description',
        text_color: '#ffffff',
        background_color: '#2ecc71',
        archived: false,
        archived_at: nil,
        updated_at: '2025-03-01T00:00:00.000Z',
        created_at: '2025-01-01T00:00:00.000Z'
      }.to_json
    end

    let(:request_body) do
      { name: 'Travel Updated', description: 'Updated travel description' }
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/tags\/\d+/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a TagObject' do
      result = api_instance.update_tag(40, request_body)
      expect(result).to be_instance_of(LunchMoney::TagObject)
    end

    it 'deserializes the updated tag' do
      result = api_instance.update_tag(40, request_body)
      expect(result.id).to eq(40)
      expect(result.name).to eq('Travel Updated')
      expect(result.description).to eq('Updated travel description')
      expect(result.background_color).to eq('#2ecc71')
      expect(result.archived).to eq(false)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.update_tag_with_http_info(40, request_body)
      expect(data).to be_instance_of(LunchMoney::TagObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#delete_tag' do
    before do
      stub_response = Typhoeus::Response.new(
        code: 204,
        body: '',
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/tags\/\d+/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns nil' do
      result = api_instance.delete_tag(40)
      expect(result).to be_nil
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.delete_tag_with_http_info(40)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
