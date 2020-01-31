FactoryBot.define do
  factory :game do
    winner_id { n }
    loser_id { n + 1 }
  end
end
