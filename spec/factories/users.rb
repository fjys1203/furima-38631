FactoryBot.define do
  factory :user do
    nickname              {'test'}
    last_name             {'あああ'}
    first_name            {'あああ'}
    last_name_kana        {'アアア'}
    first_name_kana       {'アアア'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    encrypted_password    {password}
    birthday              {'1990-01-01'}
  end
end