FactoryBot.define do
  factory :item do
    nickname              {'test'}
    last_name             {'あああ'}
    first_name            {'あああ'}
    last_name_kana        {'アアア'}
    first_name_kana       {'アアア'}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {'1990-01-01'}
  end
end
