class Theme < ApplicationRecord
  belongs_to :user
  validates :price_cent, :name, presence: true

  def price
    (price_cent/100.to_f).round(2)
  end
end
