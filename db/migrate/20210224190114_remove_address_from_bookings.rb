class RemoveAddressFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column(:bookings, :address)
  end
end
