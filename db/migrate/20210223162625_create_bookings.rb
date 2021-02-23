class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true
      t.date :starting_date
      t.date :ending_date
      t.string :address

      t.timestamps
    end
  end
end
