FactoryBot.define do
  factory :challenge do
    title { "MyString" }
    description { "MyText" }
    employee { create(:employee) }
  end
end
