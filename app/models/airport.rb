class Airport < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true
  validates :code, uniqueness: true

  has_many :arrivals, class_name: 'Flight', foreign_key: :destination_airport_id
  has_many :departures, class_name: 'Flight', foreign_key: :origin_airport_id
end
