FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '山田' }
    first_name_kana { 'ヤマダ' }
    last_name { '太郎' }
    last_name_kana { 'タロウ' }
    birthday { '2000-01-01' }
  end
end
