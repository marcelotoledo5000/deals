require 'rails_helper'

feature 'Connection with Pipeline via API' do
  scenario 'open modal to connection' do
    user = create(:user)
    login_as user

    visit root_path
    click_on 'Import Deals From HubSpot'

    expect(page).to have_css('h4', text: 'Import Deals From HubSpot')
    expect(page).to have_content('HubSpot API key:')
    expect(page).to have_button('Connect')
    select '2', from: 'Pipeline:'
    select '1', from: 'Owner:'
    expect(page).to have_content('Deals (For the Salesman Above):')
    expect(page).to have_button('Import All Selected Deals')
    expect(page).to have_button('Cancel')
  end

  xscenario 'connection established' do
    user = create(:user, email: 'g2148971@nwytg.com', password: 'Brasblowbraw')
    login_as user

    visit root_path
    click_on 'Import Deals From HubSpot'
    fill_in 'HubSpot API key', with: '40ea1464-c329-4f6e-aa9a-226774d60ce0'
    click_on 'Connect'

    expect(page).to have_content('')
  end
end
