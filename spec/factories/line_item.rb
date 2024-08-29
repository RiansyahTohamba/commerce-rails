FactoryBot.define do
  factory :line_item do
    association :item 
    association :cart 
    association :order 

    trait :single_item do
      quantity { 1 }
    end

    trait :three_items do
      quantity { 3 }
    end
  end
end
