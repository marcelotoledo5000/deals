require 'rails_helper'

RSpec.describe Deal, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:customer) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:closing_date_probability) }
  it { should validate_presence_of(:value) }
  it { should define_enum_for(:status).with_values(%i[pending won lost]) }
end
