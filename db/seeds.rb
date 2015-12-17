# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create(user_name: "admin", wins: 1, loss: 1, draw: 1, password: 'admin1')

user = User.create(user_name: "Nagibator1999", wins: 100, loss: 0, draw: 50, password: '$supernagib$')

user = User.create(user_name: "1", wins: 5, loss: 5, draw: 5, password: '1')
