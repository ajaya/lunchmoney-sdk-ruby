require 'spec_helper'
require 'json'

describe LunchMoney::CategoriesApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::CategoriesApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of CategoriesApi' do
      expect(api_instance).to be_instance_of(LunchMoney::CategoriesApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_all_categories' do
    let(:response_body) do
      {
        categories: [
          {
            id: 1,
            name: 'Groceries',
            description: 'Food and household items',
            is_income: false,
            exclude_from_budget: false,
            exclude_from_totals: false,
            is_group: false,
            archived: false,
            order: 0,
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
      Typhoeus.stub(/\/categories/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a GetAllCategories200Response' do
      result = api_instance.get_all_categories
      expect(result).to be_instance_of(LunchMoney::GetAllCategories200Response)
    end

    it 'deserializes categories array' do
      result = api_instance.get_all_categories
      expect(result.categories).to be_an(Array)
      expect(result.categories.length).to eq(1)
      expect(result.categories.first).to be_instance_of(LunchMoney::CategoryObject)
      expect(result.categories.first.name).to eq('Groceries')
      expect(result.categories.first.id).to eq(1)
      expect(result.categories.first.is_income).to eq(false)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_all_categories_with_http_info
      expect(data).to be_instance_of(LunchMoney::GetAllCategories200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#get_category_by_id' do
    let(:response_body) do
      {
        id: 42,
        name: 'Dining Out',
        description: 'Restaurants and takeout',
        is_income: false,
        exclude_from_budget: false,
        exclude_from_totals: false,
        is_group: false,
        archived: false,
        collapsed: false,
        group_id: nil,
        archived_at: nil,
        order: 3,
        updated_at: '2025-01-15T12:00:00.000Z',
        created_at: '2025-01-01T00:00:00.000Z'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/categories\/42/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a CategoryObject' do
      result = api_instance.get_category_by_id(42)
      expect(result).to be_instance_of(LunchMoney::CategoryObject)
    end

    it 'deserializes the category fields' do
      result = api_instance.get_category_by_id(42)
      expect(result.id).to eq(42)
      expect(result.name).to eq('Dining Out')
      expect(result.description).to eq('Restaurants and takeout')
      expect(result.is_income).to eq(false)
      expect(result.exclude_from_budget).to eq(false)
      expect(result.exclude_from_totals).to eq(false)
      expect(result.is_group).to eq(false)
      expect(result.archived).to eq(false)
      expect(result.order).to eq(3)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_category_by_id_with_http_info(42)
      expect(data).to be_instance_of(LunchMoney::CategoryObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#create_category' do
    let(:response_body) do
      {
        id: 99,
        name: 'Transportation',
        description: 'Buses, trains, and rideshares',
        is_income: false,
        exclude_from_budget: true,
        exclude_from_totals: false,
        is_group: false,
        archived: false,
        collapsed: false,
        group_id: nil,
        archived_at: nil,
        order: nil,
        updated_at: '2025-02-01T10:00:00.000Z',
        created_at: '2025-02-01T10:00:00.000Z'
      }.to_json
    end

    let(:request_body) do
      { name: 'Transportation', description: 'Buses, trains, and rideshares', exclude_from_budget: true }
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/categories/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a CategoryObject' do
      result = api_instance.create_category(request_body)
      expect(result).to be_instance_of(LunchMoney::CategoryObject)
    end

    it 'deserializes the created category' do
      result = api_instance.create_category(request_body)
      expect(result.id).to eq(99)
      expect(result.name).to eq('Transportation')
      expect(result.description).to eq('Buses, trains, and rideshares')
      expect(result.exclude_from_budget).to eq(true)
      expect(result.is_group).to eq(false)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.create_category_with_http_info(request_body)
      expect(data).to be_instance_of(LunchMoney::CategoryObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#update_category' do
    let(:response_body) do
      {
        id: 42,
        name: 'Dining & Restaurants',
        description: 'Updated description',
        is_income: false,
        exclude_from_budget: false,
        exclude_from_totals: true,
        is_group: false,
        archived: false,
        collapsed: false,
        group_id: nil,
        archived_at: nil,
        order: 5,
        updated_at: '2025-03-01T08:30:00.000Z',
        created_at: '2025-01-01T00:00:00.000Z'
      }.to_json
    end

    let(:request_body) do
      { name: 'Dining & Restaurants', description: 'Updated description', exclude_from_totals: true }
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/categories\/42/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a CategoryObject' do
      result = api_instance.update_category(42, request_body)
      expect(result).to be_instance_of(LunchMoney::CategoryObject)
    end

    it 'deserializes the updated category' do
      result = api_instance.update_category(42, request_body)
      expect(result.id).to eq(42)
      expect(result.name).to eq('Dining & Restaurants')
      expect(result.description).to eq('Updated description')
      expect(result.exclude_from_totals).to eq(true)
      expect(result.order).to eq(5)
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.update_category_with_http_info(42, request_body)
      expect(data).to be_instance_of(LunchMoney::CategoryObject)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#delete_category' do
    before do
      stub_response = Typhoeus::Response.new(
        code: 204,
        body: '',
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/categories\/42/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns nil' do
      result = api_instance.delete_category(42)
      expect(result).to be_nil
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.delete_category_with_http_info(42)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
