require 'spec_helper'
require 'json'

describe LunchMoney::TransactionsFilesApi do
  let(:api_client) { LunchMoney::ApiClient.new }
  let(:api_instance) { LunchMoney::TransactionsFilesApi.new(api_client) }

  describe 'initialization' do
    it 'creates an instance of TransactionsFilesApi' do
      expect(api_instance).to be_instance_of(LunchMoney::TransactionsFilesApi)
    end

    it 'has an api_client' do
      expect(api_instance.api_client).to be_instance_of(LunchMoney::ApiClient)
    end
  end

  describe '#get_transaction_attachment_url' do
    let(:response_body) do
      {
        url: 'https://example.com/files/receipt.pdf?signed=abc123',
        expires_at: '2025-01-15T01:00:00.000Z'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/transactions\/attachments\/\d+/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a GetTransactionAttachmentUrl200Response' do
      result = api_instance.get_transaction_attachment_url(50)
      expect(result).to be_instance_of(LunchMoney::GetTransactionAttachmentUrl200Response)
    end

    it 'deserializes attributes correctly' do
      result = api_instance.get_transaction_attachment_url(50)
      expect(result.url).to eq('https://example.com/files/receipt.pdf?signed=abc123')
      expect(result.expires_at).not_to be_nil
    end

    it 'returns status code and headers with _with_http_info' do
      data, status, headers = api_instance.get_transaction_attachment_url_with_http_info(50)
      expect(data).to be_instance_of(LunchMoney::GetTransactionAttachmentUrl200Response)
      expect(status).to eq(200)
      expect(headers).to respond_to(:[])
    end
  end

  describe '#attach_file_to_transaction' do
    let(:response_body) do
      {
        id: 75,
        uploaded_by: 1,
        name: 'receipt.pdf',
        type: 'application/pdf',
        size: 1024,
        notes: 'lunch receipt',
        created_at: '2025-01-15T12:00:00.000Z'
      }.to_json
    end

    before do
      stub_response = Typhoeus::Response.new(
        code: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/transactions\/\d+\/attachments/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns a TransactionAttachmentObject' do
      file = Tempfile.new(['receipt', '.pdf'])
      begin
        result = api_instance.attach_file_to_transaction(100, file)
        expect(result).to be_instance_of(LunchMoney::TransactionAttachmentObject)
      ensure
        file.close
        file.unlink
      end
    end

    it 'deserializes attributes correctly' do
      file = Tempfile.new(['receipt', '.pdf'])
      begin
        result = api_instance.attach_file_to_transaction(100, file, { notes: 'lunch receipt' })
        expect(result.id).to eq(75)
        expect(result.uploaded_by).to eq(1)
        expect(result.name).to eq('receipt.pdf')
        expect(result.type).to eq('application/pdf')
        expect(result.size).to eq(1024)
        expect(result.notes).to eq('lunch receipt')
        expect(result.created_at).not_to be_nil
      ensure
        file.close
        file.unlink
      end
    end

    it 'returns status code and headers with _with_http_info' do
      file = Tempfile.new(['receipt', '.pdf'])
      begin
        data, status, headers = api_instance.attach_file_to_transaction_with_http_info(100, file)
        expect(data).to be_instance_of(LunchMoney::TransactionAttachmentObject)
        expect(status).to eq(200)
        expect(headers).to respond_to(:[])
      ensure
        file.close
        file.unlink
      end
    end
  end

  describe '#delete_transaction_attachment' do
    before do
      stub_response = Typhoeus::Response.new(
        code: 204,
        body: '',
        headers: { 'Content-Type' => 'application/json' }
      )
      Typhoeus.stub(/\/transactions\/attachments\/\d+/).and_return(stub_response)
    end

    after do
      Typhoeus::Expectation.clear
    end

    it 'returns nil' do
      result = api_instance.delete_transaction_attachment(75)
      expect(result).to be_nil
    end

    it 'returns status code 204 with _with_http_info' do
      data, status, headers = api_instance.delete_transaction_attachment_with_http_info(75)
      expect(data).to be_nil
      expect(status).to eq(204)
      expect(headers).to respond_to(:[])
    end
  end
end
