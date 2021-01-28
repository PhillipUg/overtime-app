FactoryBot.define do
  factory :audit_log do
    user
    status { 1 }
    start_date { Date.today - 6.days }
    end_date { '2021-01-28' }
  end
end
