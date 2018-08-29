require 'rails_helper'

feature 'Connection with Pipeline via API' do
  scenario 'open modal to connection' do
    user = create(:user)
    login_as user

    visit root_path
    click_on 'Import Deals From Pipedrive'

    expect(page).to have_css('h4', text: 'Import Deals From Pipedrive')
    expect(page).to have_content('Pipedrive Token:')
    expect(page).to have_button('Connect')
    select '2', from: 'Pipeline:'
    select '1', from: 'Owner:'
    expect(page).to have_content('Deals (For the Salesman Above):')
    expect(page).to have_button('Import All Selected Deals')
    expect(page).to have_button('Cancel')
  end

  scenario 'connection established' do
    user = create(:user, email: 'g2148971@nwytg.com', password: 'Brasblowbraw')
    login_as user

    visit root_path
    click_on 'Import Deals From Pipedrive'
    fill_in 'Pipedrive Token', with: '3ca2c6065f781737c2c8d9cc5326de4d4379adde'
    click_on 'Connect'

    expect(page).to have
  end
end
