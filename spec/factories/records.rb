FactoryBot.define do
  factory :record do
    association :user
    association :item
    
    token    {"tok_abcdefghijk00000000000000000"}
  end
end
