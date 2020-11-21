# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Event.destroy_all

puts 'Creating events...'
opening = { name: 'Reopening of the Restaurants', date: Time.zone.now + 3.months, description: 'Next February, the restaurants will open again!', email: 'heloise.mazingarbe@gmail.com' }
house_move = { name: 'House Move to Annecy', date: Time.zone.now + 1.month, description: 'Moving to Annecy!', email: 'heloisemaz@gmail.com' }

[opening, house_move].each do |attributes|
  event = Event.create!(attributes)
  puts "Created #{event.name}"
end
puts 'Finished!'
