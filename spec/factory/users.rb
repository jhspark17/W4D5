FactoryBot.define do
  factory :user_test do
    username { Faker::HarryPotter.character}
    password { Faker::Internet.password}
  end
end