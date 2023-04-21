require 'rails_helper'

RSpec.feature "Text Generator Page", type: :feature, js: true do
  before do
    visit 'text_generator#index'
  end

  scenario "displays the header with the logo and title" do
    expect(page).to have_css("header h1", text: "QA with AI by Cmorodinka")
  end

  scenario "displays the navigation links" do
    expect(page).to have_link(t('navigation.about'), href: about_path)
    expect(page).to have_link(t('navigation.text_generator/index'), href: text_generator_index_path)
    expect(page).to have_link(t('navigation.results'), href: results_path)
    expect(page).to have_link(t('navigation.execution'), href: execution_path)
    expect(page).to have_link(t('navigation.passed_executions'), href: passed_executions_path)
    expect(page).to have_link(t('navigation.failed_executions'), href: failed_executions_path)
    expect(page).to have_link('Звіти', href: about_path)
  end

  scenario "displays the form with textarea, generate and clear buttons" do
    expect(page).to have_selector("form#text-generator-form")
    expect(page).to have_selector("form#text-generator-form textarea#prompt")
    expect(page).to have_button(t('generate_button'))
    expect(page).to have_button("Clear Input")
  end

#   scenario "clears the input and generated text when the clear button is clicked" do
#     fill_in "prompt", with: "Test prompt"
#     click_button "Clear Input"
#     expect(find("#prompt").value).to be_empty
#     expect(page).not_to have_content("your_generated_text_here")
#   end
# end
# scenario "submits the form and displays the generated text" do
#   # Stub the API call and response
#   stub_request(:post, "https://api.openai.com/v1/engines/text-davinci-002/completions")
#     .with(body: { "prompt": "Test prompt" }.to_json)
#     .to_return(status: 200, body: { "generated_text": "Test" }.to_json)

#   fill_in "prompt", with: "Test prompt"
#   click_button t('generate_button')
#   expect(page).to have_content("Test")
# end

#   scenario "clears the input and generated text when the clear button is clicked" do
#     fill_in "prompt", with: "Test prompt"
#     click_button "Clear Input"
#     expect(find("#prompt").value).to be_empty
#     expect(page).not_to have_content("your_generated_text_here")
#   end
end