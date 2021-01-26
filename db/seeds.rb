# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(email: 'test@email.com', password: 'cash1234', password_confirmation: 'cash1234', first_name: 'John',
                     last_name: 'mcntyre')

user2 = User.create!(email: 'broody@email.com', password: 'cash1234', password_confirmation: 'cash1234', first_name: 'Broody',
                     last_name: 'Hank')

puts '1 User created'

AdminUser.create!(email: 'cashguy@email.com', password: 'cash1234', password_confirmation: 'cash1234',
                          first_name: 'cash', last_name: 'guy')

puts '1 AdminUser created'

users = [user1, user2]
statuses = %w[submitted approved rejected]

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: users.sample, overtime_request: rand(0.0..50.0).round(1), status: statuses.sample)
end

puts '100 Posts have been created'
