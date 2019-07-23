
NUM_ideas = 200
NUM_USERS = 10
PASSWORD = "supersecret"

Like.delete_all


Review.delete_all
Idea.delete_all
User.delete_all

super_user = User.create(
  username: "Jon Snow",
  email: "js@winterfell.gov",
  password: PASSWORD
)

NUM_USERS.times do
  first_name =  Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    username: Faker::TvShows::BreakingBad.character,
    email: Faker::Internet.email,
    password: PASSWORD
  )
end
users = User.all



NUM_ideas.times do
  created_at = Faker::Date.backward(365 * 5)
  q = Idea.create(
    
    title: Faker::Games::WorldOfWarcraft.hero,
    description: Faker::Games::WorldOfWarcraft.quote,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  )
  if q.valid?
    q.reviews = rand(0..15).times.map do
      Review.new(
        body: Faker::TvShows::GameOfThrones.quote,
        user: users.sample
      )
    end
    q.likers = users.shuffle.slice(0, rand(users.count))
    
  end
end

ideas = Idea.all
reviews = Review.all

puts Cowsay.say("Generated #{ideas.count} ideas", :frogs)
puts Cowsay.say("Generated #{reviews.count} reviews", :tux)
puts Cowsay.say("Generated #{users.count} users", :stegosaurus)



puts "Login with #{super_user.email} and password: #{PASSWORD}"
