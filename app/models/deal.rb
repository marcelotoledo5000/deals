class Deal < ApplicationRecord
  belongs_to :user

  validates :customer, :description, :closing_date_probability, :value,
            presence: true

  enum status: %i[pending won lost]
end
