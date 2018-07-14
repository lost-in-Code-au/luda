# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


HOME_GROUP_TITLES = 10.times.map{ Faker::StarWars.call_squadron }

HOME_GROUP_TITLES.each do | title |
    user = User.create(name: Faker::StarWars.character, email: Faker::Internet.email, password: '123456') 
    user.save
    HomeGroup.create(title: title, user: user)
end

# STUDENTS_NAMES = 60.times.map{ Faker::StarWars.character }
# SPLIT = 0.4
# OFFSET = HOME_GROUP_TITLES.length * SPLIT
