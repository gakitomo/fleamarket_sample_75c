FactoryBot.define do
  factory :user do
    nickname {"abe"}
    sequence(:email) {Faker::Internet.email}
    password { "0000000" }
    password_confirmation { "0000000" }
  end
end