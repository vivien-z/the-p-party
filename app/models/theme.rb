class Theme < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  has_many_attached :photos

  validates :price_cent, :name, :address, presence: true
  validates :number_people, :numericality => { :greater_than_or_equal_to => 0 }

  default_scope {order("created_at DESC")}
  include PgSearch::Model
  pg_search_scope :search_by_theme_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }

  def price
    ((price_cent * 100) / 100.to_f).round(2)
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
