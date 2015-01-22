# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([[email: 'test@test.com', password: 'password', password_confirmation: 'password', 
                      username: 'TESTaBEST', bio:'lorem ipsum'],
                     [email: 'test@gmail.com', password: 'password', password_confirmation: 'password',
                      username: 'cats', bio:'lorem ipsum']])
                    

10.times do
  locations = Location.create([[name: 'dpl', description: 'haxors', user_id: 1],
                              [name: 'home', description: 'asdf', user_id: 1],
                              [name: 'home', description: 'asdf', user_id: 2]])
end

items = Item.create([[name: 'macbooks', description: 'so expensive', is_out: false, location_id: 1, user_id: 1],
                     [name: 'macbooks', description: 'so expensive', is_out: false, location_id: 1, user_id: 2]])