FactoryBot.define do
  factory :item do
    association :user
    
    item_name          {"test"}
    item_text          {Faker::Lorem.sentence}
    category_id           { 2 }
    condition_id          { 2 }
    shopping_charge_id    { 2 }
    prefecture_id         { 2 }
    days_for_send_id      { 2 }
    price              { "1000" }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end
