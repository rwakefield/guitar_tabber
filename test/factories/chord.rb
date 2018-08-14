FactoryBot.define do
  factory :chord do
    name 'G'
    diagram [3, 2, 0, 0, 3, 3]

    trait :d do
      name 'D'
      diagram [0, 0, 0, 2, 3, 2]
    end
  end
end
