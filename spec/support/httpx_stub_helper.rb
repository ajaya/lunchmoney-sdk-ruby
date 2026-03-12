# frozen_string_literal: true

# Mock classes that mimic the HTTPX response interface used by ApiClient#call_api.

class MockHTTPXHeaders
  def initialize(hash)
    @hash = hash.transform_keys(&:to_s)
  end

  def to_h
    @hash
  end

  def [](key)
    @hash[key.to_s]
  end
end

class MockHTTPXBody
  def initialize(string)
    @string = string.to_s
  end

  def to_s
    @string
  end

  def to_str
    @string
  end

  def empty?
    @string.empty?
  end

  def encoding
    @string.encoding
  end
end

class MockHTTPXResponse
  attr_reader :status, :headers, :body

  def initialize(status:, body:, headers:)
    @status = status
    @headers = MockHTTPXHeaders.new(headers)
    @body = MockHTTPXBody.new(body)
  end

  def raise_for_status
    return if (200..299).cover?(@status)

    raise HTTPX::HTTPError.new(self, self)
  end
end

# Stubs `api_client.build_request` so that it returns a MockHTTPXResponse
# without making a real HTTP call. This bypasses auth and network setup entirely.
#
# @param api_client [LunchMoney::ApiClient] the client instance to stub
# @param status [Integer] HTTP status code
# @param body [String] response body
# @param headers [Hash] response headers
def stub_httpx_response(api_client, status:, body:, headers:)
  mock_response = MockHTTPXResponse.new(status: status, body: body, headers: headers)
  allow(api_client).to receive(:build_request).and_return(mock_response)
end
