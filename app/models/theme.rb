class Theme < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :price_cent, :name, :address, presence: true

  def price
    (price_cent/100.to_f).round(2)
  end
end
