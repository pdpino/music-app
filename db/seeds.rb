# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

admin = User.create(
  first_name: 'admin',
  last_name: 'admin',
  email: 'admin@admin.cl',
  password_digest: 'admin', # TODO: how is the digest from 'admin'? use bcrypt
  role: 'admin',
  )

artists = Artist.create( Array.new(10) do
    n_members = Faker::Number.between(1, 5)
    members = Array.new(n_members) { Faker::Name.name }
    members = members.join(", ")
    {
      name: Faker::Name.unique.name,
      description: Faker::Lorem.paragraph,
      country: Faker::Address.country,
      members: members,
      active_since: Faker::Date.backward(100),
      active_until: Date.today,
      user_id: admin.id
    }
  end)
