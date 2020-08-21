require "httparty"

class OpenAI
  URI = "https://api.openai.com/v1"

  def initialize(api_key:)
    @api_key = api_key
  end

  def completion(prompt:, max_tokens: 64, temperature: 1.0, stop: "<|endoftext|>")
    request = HTTParty.post(
      "#{URI}/engines/davinci/completions",
      headers: headers,
      body: {
        prompt: prompt,
        max_tokens: max_tokens,
        temperature: temperature,
        stop: stop
      }.to_json
    )
    request.parsed_response
  end

  private

  attr_reader :api_key

  def headers
    {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{api_key}"
    }
  end
end
