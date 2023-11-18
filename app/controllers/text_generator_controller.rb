class TextGeneratorController < ApplicationController
  # def index
  # end

  def generate
    api_key = ENV['OPENAI_API_KEY']
    prompt = params[:prompt]

    # change OpenApi.new value to actual
    openai_api = OpenaiApi.new('****')
    data = openai_api.generate_text(prompt)

    #  generated_text = data.dig('choices', 0, 'text').to_s.string
    generated_text = openai_api.generate_text(prompt).first


    # Save the result
    result = Result.create(input_text: prompt, output_text: generated_text, created_at: DateTime.now)

    render json: { generated_text: generated_text, result_id: result.id }
  end

end

