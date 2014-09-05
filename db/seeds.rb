# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create! email: "user1@mailinator.com", password: "password", password_confirmation: "password"

books = user.inventories.create! name: "Books"
books.template_fields.create! name: "ISBN", structure: 'string', user_values: true
books.template_fields.create! name: "Title", structure: 'string', user_values: true
item = books.items.create!
item.setFieldValue fieldvalue_id: 1, value: "123q4234234"
item.setFieldValue fieldvalue_id: 2, value: "Harry Potter"
item.save!

movies = user.inventories.create! name: "Movies"
movies.template_fields.create! name: "Title", structure: 'string', user_values: true
movies.template_fields.create! name: "Release Year", structure: 'number', user_values: true
movie = movies.items.create!
movie.setFieldValue fieldvalue_id: 3, value: "Snakes on a Plan"
movie.setFieldValue fieldvalue_id: 4, value: "2006"
movie.save!
