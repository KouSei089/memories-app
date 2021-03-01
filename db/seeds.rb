5.times do
  Memory.create(
    title: Faker::Lorem.word,
    emotion: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
  )
end

10.times do
  User.create(
    name: Faker::Pokemon.name,
    email: Faker::Internet.email,
  )
end
