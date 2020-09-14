FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 4, mix_case: true) + "1a"}
    password_confirmation {password}
    family_name {gimei.last.kanji}
    first_name {gimei.first.kanji}
    family_kananame {gimei.last.katakana}
    first_kananame {gimei.first.katakana}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-09-01')}
  end
end