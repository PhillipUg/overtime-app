FactoryBot.define do
  factory :audit_log do
    user { nil }
    status { 1 }
    start_date { "2021-01-28" }
    end_date { "2021-01-28" }
  end
end