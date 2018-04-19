require 'rails_helper'

feature 'User set a deal as lost' do
  scenario 'successfully' do
    deal = create(:deal)
    user = create(:user)
    login_as user

    visit root_path
    click_on 'Lost'

    deal.reload
    expect(page).to have_content('Your deal was Lost!')
    expect(page).to have_content('Current Deals: US$ 2,5 B')
    expect(page).to have_css('td', text: 'Acme')
    expect(page).to have_css('td', text: 'Multi Billion Dollars Sale')
    expect(page).to have_no_css('td', text: 'Pending')
    expect(page).to have_css('td', text: 'Lost')
    expect(page).to have_css('td', text: '03/03/18')
    expect(page).to have_css('td', text: 'US$ 2,5 B')
  end
end
