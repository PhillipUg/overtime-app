# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Some Rationale' }
    user
    overtime_request { 3.5 }
  end

  factory :second_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'Some More Content' }
    user
    overtime_request { 3.5 }
  end

  factory :third_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'Some More Content' }
    user
    overtime_request { 0.5 }
  end
end
