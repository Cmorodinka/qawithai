require 'rails_helper'

RSpec.feature "Executions", type: :feature do
  let!(:execution_1) { create(:execution, input_text: 'Case name 1', output_text: 'Case steps 1', created_at: Time.current) }
  let!(:execution_2) { create(:execution, input_text: 'Case name 2', output_text: 'Case steps 2', created_at: Time.current - 1.day) }

  before do
    visit execution_path
  end

  scenario "displays the executions in a table" do
    expect(page).to have_selector('table')

    within('table') do
      expect(page).to have_content(execution_1.created_at.strftime("%d/%m/%Y %H:%M:%S"))
      expect(page).to have_content('Case name 1')
      expect(page).to have_content('Case steps 1')
      expect(page).to have_selector("input[type='checkbox']")
      expect(page).to have_content('Delete')

      expect(page).to have_content(execution_2.created_at.strftime("%d/%m/%Y %H:%M:%S"))
      expect(page).to have_content('Case name 2')
      expect(page).to have_content('Case steps 2')
      expect(page).to have_selector("input[type='checkbox']")
      expect(page).to have_content('Delete')
    end
  end

  scenario "deletes an execution" do
    within('table') do
      first('td > form').click_button('Delete')
    end

    expect(page).to have_content('Execution was successfully destroyed.')
    expect(page).not_to have_content('Case name 1')
    expect(page).not_to have_content('Case steps 1')
  end
end
