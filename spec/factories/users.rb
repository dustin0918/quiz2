FactoryBot.define do
    factory :user do
      username { Faker::Name.name }
      
      sequence(:email) {
        |n| Faker::Internet.email.sub("@", "-#{n}@")
      }
      password { "supersecret" }
      created_at {created_at}
      updated_at {updated_at}
      user_id {rand(2..1000)}
    end
  end
  