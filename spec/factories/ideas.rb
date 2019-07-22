require 'faker'
FactoryBot.define do 
    factory :idea do 
        title { Faker::Book.title}
        description{ Faker::Book.genre}
    end
end