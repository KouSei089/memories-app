5.times do
  Memory.create(
    title: Faker::Lorem.word,
    emotion: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
  )
end
