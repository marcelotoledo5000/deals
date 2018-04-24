FactoryBot.define do
  factory :deal do
    customer 'Acme'
    description 'Multi Billion Dollars Sale'
    status 0
    closing_date_probability '03/03/18'
    value 'US$ 2,5 B'
    user
  end
end
