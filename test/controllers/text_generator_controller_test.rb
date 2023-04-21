require 'spec/spec_helper.rb'

RSpec.describe TextGeneratorController, type: :controller do
  describe "POST #generate" do
    let(:openai_api) { instance_double('OpenaiApi') }
    let(:prompt) { 'test prompt' }
    let(:generated_text) { 'generated text' }
    let(:result) { instance_double('Result', id: 1) }

    before do
      allow(ENV).to receive(:[]).with('OPENAI_API_KEY').and_return('test_key')
      allow(OpenaiApi).to receive(:new).with('test_key').and_return(openai_api)
    end

    it "creates a new result with the prompt and generated text" do
      expect(openai_api).to receive(:generate_text).with(prompt).and_return([generated_text])
      expect(Result).to receive(:create).with(input_text: prompt, output_text: generated_text, created_at: DateTime).and_return(result)

      post :generate, params: { prompt: prompt }

      expect(assigns(:result)).to eq(result)
    end

    it "returns the generated text and result id in JSON format" do
      expect(openai_api).to receive(:generate_text).with(prompt).and_return([generated_text])
      allow(Result).to receive(:create).and_return(result)

      post :generate, params: { prompt: prompt }

      expect(response.body).to eq({ generated_text: generated_text, result_id: result.id }.to_json)
    end
  end
end
