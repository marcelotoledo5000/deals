require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:deals).dependent(:destroy) }
end
