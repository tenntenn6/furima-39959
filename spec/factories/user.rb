FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name_sei       { '山田' }
    family_name_mei       { '拓也' }
    family_name_kana_sei  { 'ヤマダ' }
    family_name_kana_mei  { 'タクヤ' }
    birth                 { Faker::Date.birthday }
  end
end
