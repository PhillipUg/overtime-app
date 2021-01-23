# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create!(email: 'test@test.com', password: 'secret', password_confirmation: 'secret', first_name: 'John',
                     last_name: 'mcntyre')

puts '1 User created'

AdminUser.create!(email: 'cashguy@email.com', password: 'cash1234', password_confirmation: 'cash1234',
                  first_name: 'cash', last_name: 'guy')

puts '1 AdminUser created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts '100 Posts have been created'
