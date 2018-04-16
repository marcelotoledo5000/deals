class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.string :customer
      t.string :description
      t.integer :status, default: 0
      t.string :closing_date_probability
      t.string :value

      t.timestamps
    end
  end
end
