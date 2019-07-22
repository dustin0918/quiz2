# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


NUM_IDEAS =100

Idea.destroy_all

NUM_IDEAS.times do 
    created_at = Faker::Date.backward(365*5)
    i=Idea.create(
    title: Faker::TvShows::GameOfThrones.character,
    description: Faker::TvShows::GameOfThrones.quote,
    created_at: created_at,
    updated_at: created_at
    )
end

idea=Idea.all
puts Cowsay.say("generated #{Idea.count} ideas", :frogs)
