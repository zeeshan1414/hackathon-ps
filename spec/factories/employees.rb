FactoryBot.define do
  factory :employee do
    employee_id { 'emp_101' }
    password { 'welcome1234' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
