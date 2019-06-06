class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :ride_type
      t.string :origin
      t.string :destination
      t.datetime :take_off
      t.integer :number_of_people
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
