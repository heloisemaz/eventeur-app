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
opening = {
  name: 'Reopening of the Restaurants',
  date: Faker::Date.between(from: 20.days.ago, to: Date.today + 20.days),
  description: 'Next February, the restaurants will open again!',
  email: Faker::Internet.email
}
house = {
  name: 'House Move to Annecy',
  date: Faker::Date.between(from: 20.days.ago, to: Date.today + 20.days),
  description: 'Moving to Annecy!',
  email: Faker::Internet.email
}
football = {
  name: 'Europe football championship',
  date: Faker::Date.between(from: 20.days.ago, to: Date.today + 20.days),
  description: 'European football may start back.',
  email: Faker::Internet.email
}

[opening, house, football].each do |attributes|
  event = Event.create!(attributes)
  puts "Created #{event.name}"
  3.times do
    Comment.create!(author: Faker::FunnyName.name, message: Faker::Quote.famous_last_words, event_id: event.id)
  end
end
puts 'Finished!'
