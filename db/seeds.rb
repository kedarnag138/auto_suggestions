require 'faker'

1000.times do
  User.create(name: Faker::Name.unique.name, description: Faker::Lorem.paragraph)
end