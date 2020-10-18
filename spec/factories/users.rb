FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { ForgeryJa::Name.last_name }
    first_name            { ForgeryJa::Name.first_name }
    last_name_kana        { ForgeryJa::Name.last_name(to: ForgeryJa::KANA) }
    first_name_kana       { ForgeryJa::Name.first_name(to: ForgeryJa::KANA) }
    birthday              { '1930-01-01' }
  end
end
