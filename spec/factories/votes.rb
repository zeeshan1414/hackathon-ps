FactoryBot.define do
  factory :vote do
    challenge { build(:challenge) }
    employee { build(:employee) }
  end
end
