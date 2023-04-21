require 'test_helper'

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

RSpec.describe ResultsController, type: :controller do
  describe "GET #index" do
    it "assigns @results" do
      result1 = Result.create
      result2 = Result.create
      get :index
      expect(assigns(:results)).to match_array([result1, result2])
    end
    test "should get index" do
      get results_index_url
      assert_response :success
    end
  
    test "should get show" do
      get results_show_url
      assert_response :success
    end
  end
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:result) { Result.create }

    it "assigns @result" do
      get :show, params: { id: result.id }
      expect(assigns(:result)).to eq(result)
    end

    it "renders the show template" do
      get :show, params: { id: result.id }
      expect(response).to render_template(:show)
    end
  end

  describe "DELETE #destroy" do
    let(:result) { Result.create }

    it "deletes the result" do
      expect { delete :destroy, params: { id: result.id } }.to change(Result, :count).by(-1)
    end

    it "redirects to the index page" do
      delete :destroy, params: { id: result.id }
      expect(response).to redirect_to(results_path)
    end
  end
