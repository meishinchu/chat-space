FactoryGirl.define do

  factory :group do
    id          Faker::Number.digit
    name        Faker::Name.name
  end

end
