FactoryBot.define do
  factory :result do
    input_text { "My input text" }
    output_text { "My output text" }
    created_at { Time.current }
  end
end

# spec/features/results_spec.rb
require 'rails_helper'

RSpec.feature "Results", type: :feature do
  let!(:result_1) { FactoryBot.create(:result, input_text: 'Input text 1', output_text: 'Output text 1', created_at: Time.current) }
  let!(:result_2) { FactoryBot.create(:result, input_text: 'Input text 2', output_text: 'Output text 2', created_at: Time.current - 1.day) }

  before do
    visit results_path
  end

  scenario "displays the results in a table" do
    expect(page).to have_selector('table')

    within('table') do
      expect(page).to have_content(result_1.created_at.strftime("%d/%m/%Y %H:%M:%S"))
      expect(page).to have_content('Input text 1')
      expect(page).to have_content('Output text 1')
      expect(page).to have_content('Delete')

      expect(page).to have_content(result_2.created_at.strftime("%d/%m/%Y %H:%M:%S"))
      expect(page).to have_content('Input text 2')
      expect(page).to have_content('Output text 2')
      expect(page).to have_content('Delete')
    end
  end

  scenario "deletes an execution" do
    within('table tbody tr:first-child') do
      click_button('Delete')
    end

    expect(page).to have_content('Result was successfully destroyed.')
    expect(page).not_to have_content('Input text 1')
    expect(page).not_to have_content('Output text 1')
  end
end
