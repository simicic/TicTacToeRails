FactoryBot.define do
  factory :player do
    name { |n| "#{Faker::Lorem.word} - #{n}" }
    score { 0 }
  end
end
