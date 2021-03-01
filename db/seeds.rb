#5.times do
  #Memory.create(
    #title: Faker::Lorem.word,
    #emotion: Faker::Lorem.word,
    #description: Faker::Lorem.sentence,
  #)
#end

10.times do |n|
  name = Faker::Lorem.word
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end
