class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.float :number_of_beds
      t.float :number_of_bathrooms
      t.integer :number_of_bedrooms
      t.integer :number_of_people
      t.string :city
      t.decimal :nightly_price, precision: 10, scale: 2
      t.decimal :weeknight_price, precision: 10, scale: 2
      t.decimal :weekend_night_price, precision: 10, scale: 2
      t.decimal :weekly_price, precision: 10, scale: 2
      t.decimal :monthly_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
