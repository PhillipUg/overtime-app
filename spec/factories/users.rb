# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name { 'John' }
    last_name { 'Mcntyre' }
    email { generate :email }
    phone {'0787839614'}
    password { 'secret' }
    password_confirmation { 'secret' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Mary' }
    last_name { 'Mcntyre' }
    email { generate :email }
    phone {'0787839614'}
    password { 'secret' }
    password_confirmation { 'secret' }
  end

  factory :non_authorized_user, class: 'User' do
    first_name { 'Rob' }
    last_name { 'Snow' }
    email { generate :email }
    phone {'0787839614'}
    password { 'cash1234' }
    password_confirmation { 'cash1234' }
  end
end
