json.extract! passenger, :id, :name, :email, :booking_id, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)
