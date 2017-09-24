# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'bcrypt'

admin = User.create(
  first_name: 'admin',
  last_name: 'admin',
  email: 'admin@admin.cl',
  password_digest: BCrypt::Password.create('admin'),
  role: 'admin',
  )

juan = User.create(
  first_name: 'juan',
  last_name: 'perez',
  email: 'juan@perez.cl',
  password_digest: BCrypt::Password.create('juan'),
  # role: '',
  )

pedro = User.create(
  first_name: 'pedro',
  last_name: 'perez',
  email: 'pedro@perez.cl',
  password_digest: BCrypt::Password.create('pedro'),
  # role: '',
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
