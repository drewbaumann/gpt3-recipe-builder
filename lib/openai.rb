require "http"

class OpenAI
  URI = "https://api.openai.com/v1"

  def initialize(api_key:)
    @api_key = api_key
  end

  def completion(prompt:, max_tokens: 64, temperature: 1.0, stop: "<|endoftext|>")
    response = HTTP.headers(headers).post(
      "#{URI}/engines/davinci/completions",
      json: {
        prompt: prompt,
        max_tokens: max_tokens,
        temperature: temperature,
        stop: stop
      }
    )

    response.parse
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
