class Deal < ApplicationRecord
  enum status: %i[pending won lost]
end
