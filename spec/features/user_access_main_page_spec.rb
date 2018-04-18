require 'rails_helper'

feature 'User access main page' do
  scenario 'and dont have deals to show' do
    pipedrive = '/'
    user = create(:user)
    login_as user
    visit root_path

    expect(page).to have_content('+ Deals:')
    expect(page).to have_content('Customer:')
    expect(page).to have_content('Description:')
    expect(page).to have_content('Value:')
    expect(page).to have_link('Import Deals From Pipedrive', href: pipedrive)
    expect(page).to have_content('Current Deals:')
    # expect(page).to have_content('Search')
    expect(page).to have_content("Don't have deals yet")
  end

  scenario 'successfully' do
    pipedrive = '/'
    user = create(:user)
    create(:deal)
    login_as user
    visit root_path

    expect(page).to have_link('Import Deals From Pipedrive', href: pipedrive)
    expect(page).to have_content('Current Deals: US$ 2,5 B')
    # expect(page).to have_content('Search')
  end

  scenario 'should see your deals' do
    user = create(:user)
    create(:deal)
    deal2 = create(:deal, customer: 'W&B',
                          description: 'Multi Million Dollars Sale',
                          status: 0, closing_date_probability: 'In 25 days 70%',
                          value: 'US$ 2,5 M')
    deal3 = create(:deal, customer: 'Brand',
                          description: 'Multi Thousand Dollars Sale',
                          status: 2, closing_date_probability: '03/02/2018',
                          value: 'US$ 2,5 K')
    login_as user

    visit root_path

    expect(page).to have_css('th', text: 'Customer')
    expect(page).to have_css('th', text: 'Description')
    expect(page).to have_css('th', text: 'Status')
    expect(page).to have_css('th', text: 'Closing Date/Probability')
    expect(page).to have_css('th', text: 'Value')
    expect(page).to have_css('th', text: 'Actions')
    expect(page).to have_css('td', text: 'Acme')
    expect(page).to have_css('td', text: 'Multi Billion Dollars Sale')
    expect(page).to have_css('td', text: 'Won')
    expect(page).to have_css('td', text: '03/03/18')
    expect(page).to have_css('td', text: 'US$ 2,5 B')
    expect(page).to have_css('td', text: 'Edit | Destroy | Won | Lost')
    expect(page).to have_css('td', text: deal2.customer)
    expect(page).to have_css('td', text: deal2.description)
    expect(page).to have_css('td', text: deal2.status)
    expect(page).to have_css('td', text: deal2.closing_date_probability)
    expect(page).to have_css('td', text: deal2.value)
    expect(page).to have_css('td', text: 'Edit | Destroy | Won | Lost')
    expect(page).to have_css('td', text: deal3.customer)
    expect(page).to have_css('td', text: deal3.description)
    expect(page).to have_css('td', text: deal3.status)
    expect(page).to have_css('td', text: deal3.closing_date_probability)
    expect(page).to have_css('td', text: deal3.value)
    expect(page).to have_css('td', text: 'Edit | Destroy | Won | Lost')
  end
end
