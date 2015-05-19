require 'faker'

# create one User who we can always use
u = User.where(name:'test').first_or_initialize(
  name:'test',
  password: 'hello',
  password_confirmation: 'hello',
  email: 'user@example.com',
  homepage: Faker::Internet.url
  )
u.skip_confirmation!
u.save

# create some more Users
10.times do
  u = User.new(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'hello',
    password_confirmation: 'hello',
    homepage: Faker::Internet.url 
  )
  u.skip_confirmation!
  u.save
end

# create some Wikis
20.times do
  u = User.all.sample
  body = Faker::Lorem.paragraph
  3.times{body << "<br><br><br>" << Faker::Lorem.paragraph}
  w = u.wikis.build(
    title: Faker::Lorem.sentence,
    body: body
  )
  w.save
end

# # pick 5 wikis to add some contributors
# 5.times do
#   w = Wiki.all.sample
#   3.times do
#     u = User.all.sample
#     if !(w.user == u)
#       w.contributor.new(user: u)
#     end
#   end
# end

puts "db now has #{User.all.length} users and #{Wiki.all.length} wikis"