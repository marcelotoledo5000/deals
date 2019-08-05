class AddUserToDeal < ActiveRecord::Migration[6.0]
  def change
    add_reference :deals, :user, foreign_key: true
  end
end
