# README

## Steps to setup the project

1. Clone this repository
```ruby
git clone https://github.com/zeeshan1414/hackathon-ps.git
````

2. Setup the database
```ruby
config/database.yml

username: root
password: root_password
host: localhost
```

3. Run the migrations
```ruby
rails db:migrate
```

4. Seed the database
```ruby
rails db:seed
```

5. Run the server
```ruby
rails server
```