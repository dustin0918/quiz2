require 'faker'
FactoryBot.define do 
    factory :idea do 
        title { Faker::Book.title}
        description{ Faker::Book.genre}
        association(:user, factory: :user)
    end
end