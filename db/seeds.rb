# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Create users
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: Time.now
  )
end

# Create groups
10.times do
  Group.create(
    name: Faker::Commerce.department(max: 1),
    author_id: User.all.sample.id
  )
end

# Create entities
50.times do
  Entity.create(
    name: Faker::Commerce.product_name,
    amount: Faker::Number.between(from: 1, to: 1000),
    author_id: User.all.sample.id
  )
end

# Add some groups to entities and some entities to groups (many-to-many)
Entity.all.each do |entity|
  entity.groups << Group.all.sample(rand(1..3))
end

Group.all.each do |group|
  group.entities << Entity.all.sample(rand(1..3))
end

puts 'Database populated!'
