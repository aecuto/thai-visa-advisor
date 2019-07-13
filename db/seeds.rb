# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(email: 'admin@admin.com', password: 'password')
User.create(email: 'admin@admin.com', password: 'password') #User 1

User.create(email: 'organization@user.com', password: 'password') #User 2
Organization.create(name: 'organization 1', phone: '0123456789', user_id: 2) #organization 1

User.create(email: 'organization2@user.com', password: 'password') #User 3
Organization.create(name: 'organization 2', phone: '0123456789', user_id: 3) #organization 2

User.create(email: 'family@user.com', password: 'password') #User 4
Family.create(name: 'family 1', phone: '0123456789', user_id: 4, organization_id: 1) #fam 1

User.create(email: 'family2@user.com', password: 'password') #User 5
Family.create(name: 'family 2', phone: '0123456789', user_id: 5, organization_id: 1) #fam 2

User.create(email: 'family3@user.com', password: 'password') #User 6
Family.create(name: 'family 3', phone: '0123456789', user_id: 6, organization_id: 2) #fam 3


for i in 1..7
  Member.create(first_name: "bobs #{i}", last_name: "family 1", family_id: 1)
end

for i in 1..10
  Member.create(first_name: "john #{i}", last_name: "family 2", family_id: 2)
end

for i in 1..13
  Member.create(first_name: "somchai #{i}", last_name: "family 3", family_id: 3)
end
