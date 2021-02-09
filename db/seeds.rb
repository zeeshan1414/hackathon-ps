# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..20).each { |n| Employee.create(employee_id: "EMP_#{n}", first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "welcome1234") }

tags = ['Dynamic Programming', 'Greedy Algorithm', 'Brute-force', 'Matrix', 'Arrays', 'Strings', 'Linked List', 'Graph', 'Tree']
tags.each { |tag| Tag.create(name: tag) }
