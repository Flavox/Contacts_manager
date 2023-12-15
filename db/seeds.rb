# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
Faker::Config.locale = 'fr'

puts '! Destroyed ALL !!!'
ContactRelation.destroy_all
Relation.destroy_all
Contact.destroy_all
User.destroy_all
puts ':)'

puts '! Creating users'
User.create(
  first_name: 'John',
  last_name: 'Lennon',
  email: 'john@lennon.com',
  password: '123456'
)
puts ':)'
User.create(
  first_name: 'Lala',
  last_name: 'Toto',
  email: 'lala@toto.fr',
  password: '123456'
)
puts ':) 2 users created !'

puts '! Creating relation types'
Relation.create(
  [
    { relation_type: 'Friend' },
    { relation_type: 'Pro' },
    { relation_type: 'Family' },
    { relation_type: 'Dating' },
    { relation_type: 'School'}
  ]
)
puts ':) 4 types of relation created'

puts '! Creating contacts'
50.times do
  user = User.all.sample
  contact = user.contacts.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 8, max_age: 150),
    note: Faker::Quote.most_interesting_man_in_the_world
  )

  dice = rand(1..100)
  case dice
  when 26..75
    contact.relations << Relation.all.sample
  when 76..100
    contact.relations << Relation.all.sample
    contact.relations << Relation.all.sample
  end
end
puts ':) 50 contacts created !'
