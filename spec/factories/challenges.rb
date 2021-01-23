FactoryBot.define do
  factory :challenge do
    title { "MyString" }
    description { "MyText" }
    employee { create(:employee) }
    tag { create(:tag) }
    votes { 1 }
  end
end
