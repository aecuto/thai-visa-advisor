# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@admin.com', password: 'password', is_admin: true) #User 1

Family.create(passport_no: 'a0001', name: 'family 1', phone: '0123456789') #fam 1

Family.create(passport_no: 'a0002', name: 'family 2', phone: '0123456789') #fam 2

Family.create(passport_no: 'a0003', name: 'family 3', phone: '0123456789') #fam 3

for i in 1..7
  Member.create(first_name: "bobs #{i}", last_name: "family 1", family_id: 1)
end

for i in 1..10
  Member.create(first_name: "john #{i}", last_name: "family 2", family_id: 2)
end

for i in 1..13
  Member.create(first_name: "somchai #{i}", last_name: "family 3", family_id: 3)
end

puts "Seeds successfully"
