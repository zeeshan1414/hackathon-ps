FactoryBot.define do
  factory :collaboration do
    employee { build(:employee) }
    challenge { build(:challenge) }
  end
end
