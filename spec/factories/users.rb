# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Mcntyre' }
    email { 'test@test.com' }
    password { 'secret' }
    password_confirmation { 'secret' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Mary' }
    last_name { 'Mcntyre' }
    email { 'admin@user.com' }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
