class AddUserToDeal < ActiveRecord::Migration[5.2]
  def change
    add_reference :deals, :user, foreign_key: true
  end
end
