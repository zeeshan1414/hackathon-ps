# README

## Steps to setup the project

1. Clone this repository
```ruby
git clone https://github.com/zeeshan1414/hackathon-ps.git
````

2. Install the dependencies
```ruby
bundle install
yarn install
```

3. Setup the database credentials
```ruby
config/database.yml

username: user
password: user_password
host: localhost
```

4. Create the database
```ruby
rails db:create
```

5. Run the migrations
```ruby
rails db:migrate
```

6. Seed the database
```ruby
rails db:seed
```

7. Run the server
```ruby
rails server
```

## Alternative: Using Docker Container
Note: **make sure you have docker and docker-compose installed on the system**

1. Clone this repository
```ruby
git clone https://github.com/zeeshan1414/hackathon-ps.git
```

2. Build using docker-compose
```ruby
docker-compose build
```

3. Start the app & database server
```ruby
docker-compose up
```

4. Run the migrations
```ruby
docker-compose run app rails db:migrate
```

5. Seed the database
```ruby
docker-compose run app rails db:seed
```

6. Run the server
```ruby
docker-compose up

# visit http://localhost:3001
```
