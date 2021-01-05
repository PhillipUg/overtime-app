# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name { 'John' }
    last_name { 'Mcntyre' }
    email { generate :email }
    password { 'secret' }
    password_confirmation { 'secret' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Mary' }
    last_name { 'Mcntyre' }
    email { generate :email }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
