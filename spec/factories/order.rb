# spec/factories/orders.rb
FactoryBot.define do
  factory :order do
    trait :pending do
      status { "pending" }
    end

    trait :paid do
      status { "paid" }
    end

    trait :shipped do
      status { "shipped" }
    end
  end
end
