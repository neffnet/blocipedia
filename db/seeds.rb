require 'faker'

# create one User who we can always use
u = User.where(name:'test').first_or_initialize(
  name:'test',
  password: 'hello',
  password_confirmation: 'hello',
  email: 'user@example.com'
  )
u.skip_confirmation!
u.save

# create some more Users
10.times do
  u = User.new(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'hello',
    password_confirmation: 'hello' 
  )
  u.skip_confirmation!
  u.save
end

# create some Wikis
20.times do
  w = Wiki.new(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user: User.all.sample
  )
  w.save
end

puts "db now has #{User.all.length} users and #{Wiki.all.length} wikis"