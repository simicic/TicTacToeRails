require 'faker'

10.times do
  Player.create(name: Faker::Name.name)
end
