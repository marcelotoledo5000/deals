require 'rails_helper'

feature 'User search a deal' do
  scenario 'successfully' do
    target_deal = create(:deal, customer: 'Everbrew Co',
                                description: 'Multi Million Dollars Sale',
                                status: 0, value: 'US$ 12,5 M',
                                closing_date_probability: 'In 45 days 80%')
    create(:deal, customer: 'W&B', description: 'Multi Million Dollars Sale',
                  status: 1, closing_date_probability: 'In 25 days 70%',
                  value: 'US$ 2,5 M')
    create(:deal, customer: 'Brand', description: 'Multi Thousand Dollars Sale',
                  status: 2, closing_date_probability: '03/02/2018',
                  value: 'US$ 5,0 K')
    user = create(:user)
    login_as user

    visit root_path
    fill_in 'q', with: 'EverBrew'
    click_on 'Search'

    expect(page).to have_css('td', text: target_deal.customer)
    expect(page).not_to have_css('td', text: 'W&B')
    expect(page).not_to have_css('td', text: 'Brand')
  end

  scenario 'more than one result' do
    target_deal = create(:deal, customer: 'Everbrew Co',
                                description: 'Multi Million Dollars Sale',
                                status: 0, value: 'US$ 12,5 M',
                                closing_date_probability: 'In 45 days 80%')
    create(:deal, customer: 'W&B', description: 'Multi Million Dollars Sale',
                  status: 1, closing_date_probability: 'In 25 days 70%',
                  value: 'US$ 2,5 M')
    create(:deal, customer: 'Brand', description: 'Multi Thousand Dollars Sale',
                  status: 2, closing_date_probability: '03/02/2018',
                  value: 'US$ 5,0 K')
    user = create(:user)
    login_as user

    visit root_path
    fill_in 'q', with: 'MillIOn'
    click_on 'Search'

    expect(page).to have_css('td', text: target_deal.customer)
    expect(page).to have_css('td', text: 'W&B')
    expect(page).not_to have_css('td', text: 'Brand')
  end

  scenario 'and not found' do
    create(:deal, customer: 'Brewdog Brewery', description: '5 Million Dollars',
                  status: 1, closing_date_probability: 'In 25 days 70%',
                  value: 'US$ 7,5 M')
    user = create(:user)
    login_as user

    visit root_path
    fill_in 'q', with: 'Brand'
    click_on 'Search'

    expect(page).to have_content('Deal not found')
  end
end
