class Review < ApplicationRecord
  belongs_to :theme
  validates :content, length: { minimum: 15 }
end
