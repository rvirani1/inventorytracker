# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create! email: "user1@mailinator.com", password: "password", password_confirmation: "password"
inventory = user.inventories.create! name: "Books"
item = inventory.items.create!

field = Field.create! name: "ISBN", structure: 'boolean', user_values: true
fieldvalue = field.fieldvalues.create value: "1234324234", item_id: item.id


user.inventories.create! name: "Movies"
