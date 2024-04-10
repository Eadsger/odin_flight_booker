# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.create(name: 'Toronto Pearson', code: 'YYZ')
Airport.create(name: 'Vancouver International', code: 'YWG')
Airport.create(name: 'Calgary International', code: 'YYC')
Airport.create(name: 'New York JFK', code: 'JFK')
Airport.create(name: 'New York LaGuardia', code: 'LGA')
Airport.create(name: 'Dallas/Fort Worth', code: 'DFW')
Airport.create(name: 'Los Angeles', code: 'LAX')
Airport.create(name: 'Denver', code: 'DEN')

puts 'Created 8 airports'

airline_callsigns = %w[AC AS AA DL FX NW SW WS]

25.times do
  Airport.all.each do |origin|
    destinations = Airport.where.not(id: origin.id).pluck(:id)
    destinations.each do |destination_id|
      flight = Flight.create(
        name: "%s-%03d" % [airline_callsigns.sample, rand(1..999)],
        depart_time: DateTime.now + rand(100..600),
        depart_date: Date.today + rand(2..60),
        flight_duration: rand(43..458.0),
        origin_airport_id: origin.id,
        destination_airport_id: destination_id
      )
      puts "Created Flight: #{flight.name} from #{origin.name} to #{Airport.find(destination_id).name}"
      booking = flight.bookings.create
      2.times do
        passenger = booking.passengers.create(name: 'Jim', email: 'test@test.com')
        puts "Created Booking for Passenger: #{passenger.name} on Flight: #{flight.name}"
      end
    end
  end
end

puts 'Finished creating flights and bookings.'
