class Booking < ApplicationRecord
  validates :flight_id, presence: true

  belongs_to :flight
  has_many :passengers

  accepts_nested_attributes_for :passengers, reject_if: :reject_passengers, limit: 4

  def reject_passengers(attributes)
    attributes['name'].blank? || attributes['email'].blank?
  end
end
