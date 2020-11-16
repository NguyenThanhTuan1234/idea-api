FactoryBot.define do
    factory :idea do
      body { Faker::StarWars.character }
      category_id nil
    end
  end