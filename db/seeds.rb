# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(email: 'test@email.com', password: 'cash1234', password_confirmation: 'cash1234', first_name: 'John',
                     last_name: 'mcntyre', phone: '0787839614')

user2 = User.create!(email: 'broody@email.com', password: 'cash1234', password_confirmation: 'cash1234', first_name: 'Broody',
                     last_name: 'Hank', phone: '0787839614')

puts '1 User created'

AdminUser.create!(email: 'cashguy256@email.com', password: 'cash1234', password_confirmation: 'cash1234',
                  first_name: 'cash', last_name: 'guy', phone: '0787839614')

puts '1 AdminUser created'

users = [user1, user2]
statuses = %w[submitted approved rejected]
lorem_ipsum = %w[Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer
                 took a galley of type and scrambled it to make a type specimen book It has survived not only five centuries but also the leap into electronic typesetting remaining essentially unchanged]

100.times do
  Post.create!(date: Date.today, rationale: lorem_ipsum.shuffle.join(' '), user: users.sample,
               overtime_request: rand(0.0..50.0).round(1), status: statuses.sample)
end

puts '100 Posts have been created'
mydate = Date.today + 1.day
10.times do
  AuditLog.create!(user: users.sample, start_date: (mydate -= 7.days), status: 'pending')
end

puts '100 Audit Logs have been created'
