require 'http'
require 'json'

class OpenaiApi
  BASE_URL = 'https://api.openai.com/v1/engines/text-davinci-002/completions'

  def initialize(api_key)
    @api_key = api_key
  end

  def generate_text(prompt, max_tokens = 1000, n = 1, stop = nil, temperature = 0.7)
    headers = {
      'Authorization' => "Bearer #{@api_key}",
      'Content-Type' => 'application/json',
    }

    body = {
      'prompt' => prompt,
      'max_tokens' => max_tokens,
      'n' => n,
      'temperature' => temperature,
    }
    body['stop'] = stop if stop

    response = HTTP.headers(headers).post(BASE_URL, body: body.to_json)
    result = JSON.parse(response.body)

    if response.status.success?
      result['choices'].map { |choice| choice['text'] }
    else
      raise "Error: #{result['error']['message']}"
    end
  end
end

