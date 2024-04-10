class Flight < ApplicationRecord
  validates :name, presence: true
  validates :depart_time, presence: true
  validates :depart_date, presence: true
  validates :origin_airport_id, presence: true
  validates :destination_airport_id, presence: true

  belongs_to :destination, class_name: 'Airport',
                           foreign_key: 'destination_airport_id'

  belongs_to :origin, class_name: 'Airport',
                      foreign_key: 'origin_airport_id'

  has_many :bookings
  has_many :passengers, through: :bookings

  def display_depart_time_only
    depart_time.strftime('%r')
  end
end
